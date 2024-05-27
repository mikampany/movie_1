import 'dart:core';

class Validator {
  static String validateName({required String name}) {
    if (name == null) {
      return 'Name cannot be null';
    }
    if (name.isEmpty) {
      return 'Name cannot be empty';
    }
    return 'OK';
  }

  static String validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email == null) {
      return 'email cannot be null';
    }
    if (email.isEmpty) {
      return 'email cannot be empty';
    }
    if (!emailRegExp.hasMatch(email)) {
      return 'Enter a Correct email';
    }
    return 'OK';
  }

  static String validatePassword({required String password}) {
    if (password == null) {
      return 'password cannot be null';
    }
    if (password.isEmpty) {
      return 'password cannot be empty';
    }
    if (password.length < 6) {
      return 'Enter a password of at least 6 characters';
    }
    return 'OK';
  }
}
