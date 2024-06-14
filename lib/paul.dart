import 'package:mysql_client/mysql_client.dart';

Future<void> main() async {
  // print('object');
  final pool = MySQLConnectionPool(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '?00chin@',
      maxConnections: 10,
      databaseName: 'pvis');


  var result = await pool.execute('SELECT personal.name, personal.id_number, car_details.number_plate, car_details.date_of_purchase, car_details.type_of_car FROM personal JOIN car_details ON personal.id_number = car_details.personal_id WHERE personal.id_number = 10000008');
  print(result);

  for (final row in result.rows) {
    // print(row.colByName('userId'));
    print(row.assoc());
    // row.toString()po
  }
  pool.close();
}
