import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  late SharedPreferences prefs;
  static const String _language = "LANG";
  static const String _token = 'TOKEN';

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_language, language);
  }

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_language);
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_token);
  }
}
