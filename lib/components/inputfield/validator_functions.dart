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
}
