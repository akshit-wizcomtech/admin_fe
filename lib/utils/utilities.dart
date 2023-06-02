import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void hideKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

Future<SharedPreferences> sharedPreferencesInstance() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

String formatDuration_mmSS(Duration duration) {
  return duration.toString().split(".")[0].split(":").sublist(1).join(":");
}
