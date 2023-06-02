import 'dart:async';

import 'package:admin_fe/models/index.dart';

Future<List<Map>> viewPenTab({required String organizationId}) async {
  int archive = 0;
  final conn = await valid1();
  try {
    print("Connected");

    var viewPen = await conn.execute(
        "select serialnumber, batteryPer, CurrentStatus, type from pen_master where arstatus = ' $archive ' and orgid = '$organizationId'");

    // ResultSet rs = conn.createStatement().executeQuery(
    //     "select serialnumber, orgId, batteryPer,CurrentStatus from pen_master where arstatus = '" +
    //         "0");
    // if (viewPen.numOfRows > 0) {
    //   String penName = viewPen.getString(1).trim();
    //   //    list_name.add(penName);
    //   print(penName);
    // }
    List<Map> pens = [];
    for (final row1 in viewPen.rows) {
      pens.add({
        "serialNumber": row1.colAt(0),
        "batteryPercentage": row1.colAt(1),
        "currentStatus": row1.colAt(2),
        "type": row1.colAt(3),
      });
    }
    return pens;
  } catch (e) {
    print("Error is : $e");
  }

  return [];
}
