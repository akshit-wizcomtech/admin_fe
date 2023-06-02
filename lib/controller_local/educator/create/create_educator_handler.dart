import 'dart:async';

import 'package:admin_fe/models/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';

import '../../../utils/them.dart';

// TODO: recreate hanlder
Future createEducatorHandler(
    BuildContext context, Map<String, dynamic> data) async {
  // var fname;
  final conn = await valid1();
  try {
    print("Connected");
    var email = "";
    var password = "";
    var loginDetails = await conn.execute(
        "select userid,password,fname,orgid from user_master where userid = '$email' and password = '$password' ");
    //
    // for (final row1 in loginDetails.rows) {
    //   fname = row1.colAt(2);
    // }
    if (loginDetails.numOfRows == 1) {
/* ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Login Success')),
);*/

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success',
              style: TextStyle(color: ReplyColors.black),
              textAlign: TextAlign.center),
          backgroundColor: ReplyColors.white,
          elevation: 10,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 2500),
          margin: EdgeInsets.all(50),
        ),
      );
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, Routes.underDevelopmentPage),
      );
    } else {
/*ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Login Invalid')),
);*/
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Credentials',
              style: TextStyle(color: ReplyColors.black),
              textAlign: TextAlign.center),
          backgroundColor: ReplyColors.white,
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
  }
}
