import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysql_client/mysql_client.dart';

class Charges extends StatefulWidget {
  const Charges({super.key});

  @override
  State<Charges> createState() => _ChargesState();
}

class _ChargesState extends State<Charges> {
  List<Map<String, dynamic>> mylist = [];

  @override
  void initState() {
    super.initState();
    Maypul();
  }

  Future<void> Maypul() async {
    try {
      final pool = MySQLConnectionPool(
        host: 'localhost',
        port: 3306,
        userName: 'root',
        password: '?00chin@',
        maxConnections: 10,
        databaseName: 'policea',
      );

      var result =
          await pool.execute('''select carownerapp_police_station.station_name,
          carownerapp_charges.Charges from carownerapp_charges Join carownerapp_police_station ON 
          carownerapp_police_station.Police_station_code = carownerapp_charges.Police_station_code_id''');
      print(result);

      for (final row in result.rows) {
        // print(row.assoc());
        // print(row.);
        mylist.add(row.assoc());
      }

      pool.close();
    } catch (e) {
      print('Error: $e');
    }
    setState(() {}); // Trigger a rebuild after data fetching
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('CHARGES'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (context, index) {
            final item = mylist[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              item['station_name'].toString(),
                              style: TextStyle(color: const Color.fromARGB(255, 92, 95, 97)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Flutter provides a simple widget called table calendar to display the flutter calendar in our flutter app. The table calendar is very customisable and has many features like gestures, animation, and numerous formats.',
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            );
            //   return ListTile(
            //     leading: Text('paul'+
            //       item['name'].toString(),
            //     ),
            //     title: Text(item['date_of_purchase'].toString()),
            //     subtitle: Text(item['type_of_car'].toString()),
            //   );
          },
        ),
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}
