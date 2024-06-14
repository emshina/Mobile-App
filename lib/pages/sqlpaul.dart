import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';


 

void main() {

  runApp(const MyApp());

}

 
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

 

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter mySQL CRUD Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),

      home: const MyHomePage(title: 'Flutter MySQL CRUD Demo Home Page'),

    );

  }

}

 

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override

  State<MyHomePage> createState() => _MyHomePageState();

}

 
Future<void> Maypul() async {
  // print('object');
  final pool = MySQLConnectionPool(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '?00chin@',
      maxConnections: 10,
      databaseName: 'policestationa');


  var result = await pool.execute('SELECT * FROM paul');
  print(result);

  for (final row in result.rows) {
    print(row.colByName('userId'));
    // print(row.);
    // row.toString()po
  }
  pool.close();
}


  // return mylist;




class _MyHomePageState extends State<MyHomePage> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),

      ),

      body: Center(

        child: showFutureDBData(),

      ),

    );

  }

}

 

showFutureDBData() {

  

          return ListTile(

            leading: Text(''),

            title: Text(''),

            subtitle: Text(''),

          );

        }

