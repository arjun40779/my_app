class InputValidator {
  static String? validateEmail(String? value) {
    if (value == null) {
      return "Input is empty";
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailRegExp.hasMatch(value)) {
      return null;
    }
    return "Invalide Email";
  }

  static String? validateName(String? value) {
    if (value == null) {
      return "Input is empty";
    }
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (nameRegExp.hasMatch(value)) {
      return null;
    }
    return "Invalide Name";
  }

  static String? validatePhone(String? value) {
    if (value == null) {
      return "Input is empty";
    }
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    if (phoneRegExp.hasMatch(value)) {
      return null;
    }
    return "Invalide Phone Number";
  }

  static String? validatePassword(String? value) {
    if (value == null) {
      return "Input is empty";
    }
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (passwordRegExp.hasMatch(value)) {
      return null;
    }
    return "Invalide Password";
  }

  static String? validateDate(value) {
    List<String> date = value.split("-");
    DateTime currDate = DateTime.now();
    int currYear = currDate.year;
    int currMonth = currDate.month;
    int currDay = currDate.day;

    if (value.isNotEmpty) {
      if (value.length > 3) {
        int year = int.parse(date[0]);

        if (year < 1900 || year > currYear) {
          return "Invalid year";
        }
        if (value.length > 6) {
          int month = int.parse(date[1]);
          if (month < 1 ||
              month > 12 ||
              (currYear == year && month > currMonth)) {
            return "Invalid month";
          }
          if (value.length > 9) {
            int day = int.parse(date[2]);
            int maxDateInMonth = getDaysInMonth(year, month);

            if (day < 1 ||
                day > maxDateInMonth ||
                (currYear == year && currMonth == month && day > currDay)) {
              return "invalid day";
            }
          }
        }
      }
    }
    if (value.length < 10) return "please enter valid date";
    return null;
  }

  static int getDaysInMonth(int year, int month) {
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    DateTime lastDayOfCurrentMonth =
        firstDayOfNextMonth.subtract(const Duration(days: 1));
    return lastDayOfCurrentMonth.day;
  }
}
