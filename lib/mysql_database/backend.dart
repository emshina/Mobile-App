// import 'package:flutter/material.dart';
// import 'package:mysql_client/mysql_client.dart';

// import 'package:http/http.dart' as http;

// class Mysqlconnect extends StatefulWidget {
//   const Mysqlconnect({super.key});

//   @override
//   State<Mysqlconnect> createState() => _MysqlconnectState();
// }

// class _MysqlconnectState extends State<Mysqlconnect> {
//   final conn = MySQLConnection.createConnection(
//   host: 'localhost',
//   port: 3309,
//   userName: 'root',
//   password: '?00chin@',
//   databaseName: 'paul',
// );
//   // conn.connect()

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



 import 'package:mysql_client/mysql_client.dart';

class Mysql {
  static String host = 'localhost',
      user = 'root',
      password = '?00chin@',
      db = 'policestationa';

  static int port = 3306;

  Mysql();

  Future<MySQLConnectionPool> getConnection() async {
    var settpool=  MySQLConnectionPool(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '?00chin@',
      maxConnections: 10,
      databaseName: 'policestationa');

    return settpool;
  }
}





// import 'package:mysql1/mysql1.dart';

// class Mysql {
//   static String host = 'localhost',
//       user = 'root',
//       password = '?00chin@',
//       db = 'policestationa';

//   static int port = 3306;

//   Mysql();

//   Future<MySqlConnection> getConnection() async {
//     var settings = ConnectionSettings(
//         host: host, port: port, user: user, password: password, db: db);

//     return await MySqlConnection.connect(settings);
//   }
// }
