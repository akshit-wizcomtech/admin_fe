import 'package:mysql_client/mysql_client.dart';

abstract class mysql {
/* Future<MySqlConnection> getConnect() async {
var settings = new ConnectionSettings(
host: '192.168.0.109',
port: 3306,
user: 'user',
db: 'ScanPen_1',
password: 'user@123');
return await MySqlConnection.connect(settings);
}*/
  valid1();
}

Future valid1() async {
// create connection
  final conn = await MySQLConnection.createConnection(
    host: '192.168.0.109',
    port: 3306,
    userName: "user",
    password: "user@123",
    databaseName: "ScanPen_1", // optional
  );
  await conn.connect();
  print("Connected now to Db");

  return conn;
}
