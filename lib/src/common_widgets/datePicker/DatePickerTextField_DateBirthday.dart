import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

class DatePickerTextField extends ConsumerWidget {
  const DatePickerTextField(
      {Key? key,
        required this.controller
      }) : super(key: key);

  final TextEditingController controller;

  //WidgetRef it allows you to interact with providers inside a widget.
  Future<void> _selectDate(BuildContext context, WidgetRef ref) async{
    DateTime initialDate = DateTime.now();

    if(controller.text.isNotEmpty){
      try{
        initialDate = DateTime.parse(controller.text);
      } catch(_){}
    }

    final DateTime? picked = await showDatePicker(
      context:  context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if(picked != null){
      final formatted = "${picked.day}/${picked.month}/${picked.year}";
      controller.text = formatted;
      
      //Update the provider if you want other widgets to read this date.
      ref.read(selectedDateProvider.notifier).state = picked;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return TextFormField(
      controller: controller,
      readOnly: true, //Important to open only the date picker.
      decoration: InputDecoration(
        labelText: 'Data di nascita',
        prefixIcon: Icon(Icons.cake),
        hintText: 'Seleziona la data',
      ),
      onTap: () => _selectDate(context, ref),
      validator: (value){
        if(value == null || value.isEmpty){
          return 'per favore seleziona una data';
        }
        return null;
      },
    );
  }
}
