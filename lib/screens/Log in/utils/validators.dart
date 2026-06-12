class Validators {

  static String? validateEmail(
      String email) {

    if (email.isEmpty) {
      return "Email is required";
    }

    if (!email.contains('@')) {
      return "Enter valid email";
    }

    return null;
  }

  static String? validatePassword(
      String password) {

    if (password.isEmpty) {
      return "Password is required";
    }

    if (password.length < 6) {
      return "Minimum 6 characters";
    }

    return null;
  }
}
