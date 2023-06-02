import 'package:admin_fe/models/db/index.dart';

Future<List<Map>> addPenManuallyHandler({required String serialNumber}) async {
  int archive = 0;
  final conn = await valid1();
  try {
    print("Connected");

    var serialNumberRecord = await conn.execute(
        "select serialnumber, type , regstatus , currentstatus ,batteryPer from pen_master where serialnumber = '$serialNumber' ");

    List<Map> pens = [];
    for (final row1 in serialNumberRecord.rows) {
      pens.add({
        "serialNumber": row1.colAt(0),
        "type": row1.colAt(1),
        "registeredStatus": row1.colAt(2),
        "currentStatus": row1.colAt(3),
        "batteryPercentage": row1.colAt(4),
      });
    }
    return pens;
  } catch (e) {
    print("Error is : $e");
  }

  return [];
}
