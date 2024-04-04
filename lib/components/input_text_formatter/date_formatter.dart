import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  final String separator;
  DateFormatter({this.separator = "-"});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    // Add separator after 3rd and 6th digit
    var formattedValue = '';

    for (int i = 0; i < newText.length; i++) {
      formattedValue += newText[i];

      if ((i == 3 || i == 5) && i != newText.length - 1) {
        formattedValue += '-';
      }
    }

    // Return the formatted text with the same selection/cursor position
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
