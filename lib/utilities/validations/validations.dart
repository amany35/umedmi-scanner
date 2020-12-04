class Validations {
  String validateName(String value) {
    if (value.isEmpty) return "requriedField";
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value)) return "validChar";
    return null;
  }

  String validateEmail(String value) {
     if (value.isEmpty) return 'Email is required.';
    final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value)) return 'Invalid email address';
    return null;
//    if (value.isEmpty) return "emailRequired";
//    if (!EmailValidator.validate(value)) return "enterValidMail";
//    return null;
  }

  String validateConfirmPassword(String pass1, String pass2) {
    if (pass1 != pass2) return "passwordNotMatched";
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return "choosePAssword";
    return null;
  }
}
