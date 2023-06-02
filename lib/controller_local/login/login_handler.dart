import 'dart:async';

import 'package:admin_fe/models/index.dart';
import 'package:admin_fe/utils/index.dart';
import 'package:admin_fe/utils/sharedPreferences.extension.dart';
import 'package:flutter/material.dart';

Future<bool> loginCheck(
    BuildContext context, String email, String password) async {
  var fname;
  var organizationId;
  final conn = await valid1();
  try {
    print("Connected");

    var loginDetails = await conn.execute(
        "select userid,password,fname,orgid from user_master where userid = '$email' and password = '$password' ");

    for (final row1 in loginDetails.rows) {
      fname = row1.colAt(2);
      organizationId = row1.colAt(3);
    }
    if (loginDetails.numOfRows == 1) {
      final prefs = await sharedPreferencesInstance();
      await prefs.setBool(STORAGE_KEYS.IS_LOGGED_IN, true);
      await prefs.setObject(STORAGE_KEYS.USER_DATA,
          {"firstName": fname.toString(), "organizationId": organizationId});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center),
          backgroundColor: Colors.white,
          elevation: 10,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 2500),
          margin: EdgeInsets.all(50),
        ),
      );
      // Timer(
      //   const Duration(seconds: 0),
      //   () => Navigator.pushNamed(context, Routes.homepage,
      //       arguments: {"fname": fname.toString()}),
      // );
      // Timer(
      //   const Duration(seconds: 0),
      //   () => Navigator.pushNamed(context, Routes.underDevelopmentPage,
      //       arguments: {"fname": fname.toString()}),
      // );

      return true;
    } else {
      sharedPreferencesInstance().then((value) {
        value.setBool(STORAGE_KEYS.IS_LOGGED_IN, false);
        value.remove(STORAGE_KEYS.USER_DATA);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Credentials',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center),
          backgroundColor: Colors.white,
          elevation: 10,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 6),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 3000),
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 80),
        ),
      );
    }
    conn.close();
  } catch (e) {
    print("error is : $e");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Server error",
            style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
        backgroundColor: Colors.white,
        elevation: 10,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(vertical: 10),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 2500),
        margin: EdgeInsets.all(50),
      ),
    );
  }

  return false;
}
