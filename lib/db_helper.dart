import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  static const String _namesKey = 'names';

  static Future<void> addNama(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    final names = prefs.getStringList(_namesKey) ?? [];
    names.add(nama);
    await prefs.setStringList(_namesKey, names);
  }

  static Future<List<String>> getNames() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_namesKey) ?? [];
  }

  static Future<void> deleteName(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    final names = prefs.getStringList(_namesKey) ?? [];
    names.remove(nama);
    await prefs.setStringList(_namesKey, names);
  }

  static Future<void> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_namesKey);
  }
}
