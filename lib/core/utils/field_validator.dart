class FieldValidator {
  static String? validateUsername(String? value, {String? invalidMessage}) {
    String pattern = r'(^[a-z][a-z0-9_.-]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Username is required";
    } else if (!regExp.hasMatch(value)) {
      return invalidMessage ?? "Please enter a valid user name";
    }
    return null;
  }

  static String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid name";
    }
    return null;
  }

  static String? validateEmptyField(String? value) =>
      value == null || value.isEmpty ? "Item Name is required" : null;

  static String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Mobile is required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }

    if (value.length < 8) {
      return "Password must be equal or more than 8 characters";
    }

    if (!isPasswordValid(value)) {
      return "Password must contains at least one uppercase letter, special character and number";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static bool isPasswordValid(String? password) {
    if (password == null) {
      return false;
    }

    // Define regular expressions
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final numberRegex = RegExp(r'[0-9]');

    // Check conditions
    final hasSpecialChar = specialCharRegex.hasMatch(password);
    final hasUppercase = uppercaseRegex.hasMatch(password);
    final hasLowercase = lowercaseRegex.hasMatch(password);
    final hasNumber = numberRegex.hasMatch(password);

    return hasSpecialChar && hasUppercase && hasLowercase && hasNumber;
  }
}
