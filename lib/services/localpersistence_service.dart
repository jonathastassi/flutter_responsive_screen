import 'package:shared_preferences/shared_preferences.dart';

class LocalPersistenceService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> setValue(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  deleteValue(String key) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  Future<String?> getValue(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }
}
