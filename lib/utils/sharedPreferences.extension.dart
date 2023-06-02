import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension ExtendedSharedPreferences on SharedPreferences {
  Future<bool> setObject(String key, Object object) async {
    return setString(key, jsonEncode(object));
  }

  Map getObject(String key) {
    return jsonDecode(getString(key) ?? "{}");
  }
}
