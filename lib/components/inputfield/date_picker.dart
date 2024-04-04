import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final TextEditingController controller;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const DatePickerButton(
      {super.key,
      required this.controller,
      required this.initialDate,
      required this.firstDate,
      required this.lastDate});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  late TextEditingController controller;
  late DateTime initialDate;
  late DateTime firstDate;
  late DateTime lastDate;
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    initialDate = widget.initialDate;
    firstDate = widget.firstDate;
    lastDate = widget.lastDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked.toString() != controller.text) {
      //formates date and removes time stamp
      final String year = picked.year.toString();
      final String month =
          picked.month < 10 ? "0${picked.month}" : "${picked.month}";
      final String day = picked.day < 10 ? "0${picked.day}" : "${picked.day}";
      setState(() {
        controller.text = "$year-$month-$day";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _selectDate(context);
      },
      icon: const Icon(Icons.calendar_month_outlined),
    );
  }
}
