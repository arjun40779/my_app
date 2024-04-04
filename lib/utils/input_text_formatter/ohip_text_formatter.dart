import 'package:flutter/services.dart';

class OHIPNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (newText.length > 10) {
      newText = newText.substring(0, 10);
    }
    // Add separator after 3rd and 6th digit
    var formattedValue = '';
    for (int i = 0; i < newText.length; i++) {
      if (newText.length > 10) break;
      formattedValue += newText[i];
      if ((i == 2 || i == 5) && i != newText.length - 1) {
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
