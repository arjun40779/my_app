import 'package:flutter/services.dart';

class CardFormatter extends TextInputFormatter {
  final String separator;
  CardFormatter({this.separator = "-"});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Add spaces after every 4 characters
    var formattedValue = '';
    for (int i = 0; i < newText.length; i++) {
      formattedValue += newText[i];
      if ((i + 1) % 4 == 0 && i != newText.length - 1) {
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
