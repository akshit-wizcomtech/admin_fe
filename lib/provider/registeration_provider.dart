import 'dart:async';

import 'package:admin_fe/models/db/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganisationMaster {
  String? orgId = "";
  String? orgName = "";
  String? orgAddress = "";
  String? orgType = "";
  String? penReq = "false";
  String? langsProcured = "5";
  String? orgCount = "null";
  String? country = "";
  String? zipcode = "";

  @override
  String toString() {
    return "'$orgId', '$orgName', '$orgAddress', '$orgType', '$penReq', '$langsProcured' , '$orgCount', '$country', '$zipcode'";
  }
}

class UserMaster {
  String? userId = "";
  String? orgId = "";
  String? password = "";
  String? passcode = "";
  String? accountType = "";
  String? userType = "admin";
  String? arStatus = "0";
  String? loginStatus = "0";
  String? title = "";
  String? firstName = "";
  String? lastName = "";
  String? gender = "M";
  String? imagePath = "null";
  String? permissionLevel = "platinum";
  String? newsletter = "";
  String? mobileNumber = "";
  String? address = "";

  @override
  String toString() {
    return "'$userId', '$orgId', '$password', '$passcode', '$userType', '$accountType', '$arStatus' , '$loginStatus', '$title' , '$firstName', '$lastName', '$imagePath', '$gender', '$permissionLevel', '$newsletter', '$mobileNumber', '$address'";
  }
}

class RegisterationProvider extends ChangeNotifier {
  OrganisationMaster organisationMaster = OrganisationMaster();
  UserMaster userMaster = UserMaster();

  // erase all
  void resetProviderState() {
    organisationMaster = OrganisationMaster();
    userMaster = UserMaster();
    notifyListeners();
  }

  // update profile selection
  void updateProfileSelection(String userType) {
    userMaster.userType = userType;
    notifyListeners();
  }

  // update organisation master
  void updateOrganisationMaster(
      {String? orgId,
      String? orgName,
      String? orgAddress,
      String? orgType,
      String? penReq,
      String? langsProcured,
      String? orgCount,
      String? country,
      String? zipcode}) {
    organisationMaster.orgId = orgId ?? organisationMaster.orgId;
    organisationMaster.orgName = orgName ?? organisationMaster.orgName;
    organisationMaster.orgAddress = orgAddress ?? organisationMaster.orgAddress;
    organisationMaster.orgType = orgType ?? organisationMaster.orgType;
    organisationMaster.penReq = penReq ?? organisationMaster.penReq;
    organisationMaster.langsProcured =
        langsProcured ?? organisationMaster.langsProcured;
    organisationMaster.orgCount = orgCount ?? organisationMaster.orgCount;
    organisationMaster.country = country ?? organisationMaster.country;
    organisationMaster.zipcode = zipcode ?? organisationMaster.zipcode;
    notifyListeners();
  }

  // update user master
  void updateUserMaster({
    String? userId,
    String? orgId,
    String? password,
    String? passcode,
    String? accountType,
    String? userType,
    String? arStatus,
    String? loginStatus,
    String? title,
    String? firstName,
    String? lastName,
    String? gender,
    String? imagePath,
    String? permissionLevel,
    String? newsletter,
    String? mobileNumber,
    String? address,
  }) {
    userMaster.userId = userId ?? userMaster.userId;
    userMaster.orgId = orgId ?? userMaster.orgId;
    userMaster.password = password ?? userMaster.password;
    userMaster.passcode = passcode ?? userMaster.passcode;
    userMaster.accountType = accountType ?? userMaster.accountType;
    userMaster.userType = userType ?? userMaster.userType;
    userMaster.arStatus = arStatus ?? userMaster.arStatus;
    userMaster.loginStatus = loginStatus ?? userMaster.loginStatus;
    userMaster.title = title ?? userMaster.title;
    userMaster.firstName = firstName ?? userMaster.firstName;
    userMaster.lastName = lastName ?? userMaster.lastName;
    userMaster.gender = gender ?? userMaster.gender;
    userMaster.imagePath = imagePath ?? userMaster.imagePath;
    userMaster.permissionLevel = permissionLevel ?? userMaster.permissionLevel;
    userMaster.newsletter = newsletter ?? userMaster.newsletter;
    userMaster.mobileNumber = mobileNumber ?? userMaster.mobileNumber;
    userMaster.address = address ?? userMaster.address;
    notifyListeners();
  }

  Future postDB(BuildContext context) async {
    final conn = await valid1();
    try {
      await conn.execute(
          "INSERT INTO organization_master VALUES ( ${organisationMaster.toString()} )");
      await conn.execute(
          "INSERT INTO user_master VALUES ( ${userMaster.toString()})");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Success',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center),
          backgroundColor: Colors.white,
          elevation: 10,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 2000),
          margin: EdgeInsets.all(50),
        ),
      );

      FocusScope.of(context).requestFocus(FocusNode());
      Timer(const Duration(seconds: 4), () {
        Navigator.pushNamed(context, Routes.loginPage);
      });

      conn.close();
    } catch (e) {
      print("error this : $e");
    }
  }
}

RegisterationProvider useRegisterationProvider(BuildContext context) {
  return Provider.of<RegisterationProvider>(context);
}
