import 'dart:convert';

import 'package:my_marvel_list/utils/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStore {
  static Future<bool> saveMap(
      final String key, final Map<String, dynamic> value) async {
    return _saveString(key, jsonEncode(value));
  }

  static Future<bool> _saveString(final String key, final String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future<Map<String, dynamic>> getMap(final String key) async {
    try {
      return jsonDecode(await _getString(key));
    } catch (e) {
      logger.e(e);
      return <String, dynamic>{};
    }
  }

  static Future<String> _getString(final String key,
      [final String defaultValue = '']) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? defaultValue;
  }

  static Future<bool> remove(final String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }
}
