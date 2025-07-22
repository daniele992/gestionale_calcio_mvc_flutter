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

    return GestureDetector(
      onTap: () => _selectDate(context, ref),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Data di nascita',
          prefixIcon: Icon(Icons.cake),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        child: Text(
          selectedDate != null
              ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
              : 'Seleziona una data',
          style: TextStyle(
            color: selectedDate != null ? Colors.black : Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}