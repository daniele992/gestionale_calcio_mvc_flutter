import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePickerTextField extends ConsumerWidget {
  final StateProvider<DateTime?> dateProvider;

  const DatePickerTextField({
    Key? key,
    required this.dateProvider,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final currentDate = ref.read(dateProvider) ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      ref.read(dateProvider.notifier).state = picked;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final textController = TextEditingController(
      text: selectedDate != null
          ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
          : '',
    );

    return TextFormField(
      readOnly: true,
      controller: textController,
      onTap: () => _selectDate(context, ref),
      validator: (_) {
        final date = ref.read(dateProvider);
        if(date == null) return 'Seleziona una data';
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Data di nascita',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.cake),
        border: OutlineInputBorder(),
        //isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      ),
    );
  }
}