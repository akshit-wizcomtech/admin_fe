import 'package:admin_fe/routes/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/utils/sharedPreferences.extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool _isLoggedIn = false;
  Map _userData = {};

  AuthProvider({required this.sharedPreferences}) {
    // sharedPreferencesInstance().then((value) {
    //   _isLoggedIn = value.getBool(STORAGE_KEYS.IS_LOGGED_IN) ?? false;
    // });
    _isLoggedIn = sharedPreferences.getBool(STORAGE_KEYS.IS_LOGGED_IN) ?? false;
    _userData = sharedPreferences.getObject(STORAGE_KEYS.USER_DATA);
    notifyListeners();
  }

  bool isAuthenticated() {
    return _isLoggedIn;
  }

  void reloadLoginState() {
    _isLoggedIn = sharedPreferences.getBool(STORAGE_KEYS.IS_LOGGED_IN) ?? false;
    _userData = sharedPreferences.getObject(STORAGE_KEYS.USER_DATA);
    notifyListeners();
  }

  Map getUserData() {
    return _userData;
  }

  void logout(BuildContext context) {
    sharedPreferences.clear().then((value) {
      reloadLoginState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.indexPage, (route) => false);
      });
    });
  }
}

AuthProvider useAuthProvider(BuildContext context) {
  return Provider.of<AuthProvider>(context);
}
