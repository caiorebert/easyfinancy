import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(key);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}