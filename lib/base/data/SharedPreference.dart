import 'package:shared_preferences/shared_preferences.dart';
import 'package:umedmiscanner/contstants/SharedPreferenceConstants.dart';


class SharedPreference {
  static final SharedPreference _preference = SharedPreference._internal();
  static String username = '';
  static String pass = '';
  static String Type = 'local';
  static bool rememberMe = false;

  factory SharedPreference() {
    return _preference;
  }

  SharedPreference._internal();

  String selectedLanguage = '';

  Future setPreferredLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(languagePreference, language);
  }
  static Future clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  Future<String> getPreferredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguage = prefs.getString(languagePreference);
    if (selectedLanguage == null) setPreferredLanguage('');
    return selectedLanguage;
  }
  static Future setLoginType(String type) async {
    SharedPreference.Type = type;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(typePreference, type);
  }

  static Future getLoginType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Type = prefs.getString(usernamePreference);
    if (Type == null) setLoginType('');
  }
  static Future getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString(usernamePreference);
    if (username == null) setUsername('');
  }
  static Future setPassword(String password) async {
    SharedPreference.pass = password;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordPreference, password);
  }
  static Future getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pass = prefs.getString(passwordPreference);
    if (pass == null) setPassword('');
  }
  static Future setUsername(String username) async {
    SharedPreference.username = username;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernamePreference, username);
  }
  static Future setRememberMe(bool rememberMe) async {
    SharedPreference.rememberMe = rememberMe;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(boolPreference, rememberMe);
  }
  static Future getRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool(boolPreference);
    if (rememberMe == null) setRememberMe(false);
  }
}

SharedPreference preferences = SharedPreference();
