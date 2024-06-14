import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

import 'package:pvis/components/my_silverbar.dart';

class PoliceStation extends StatefulWidget {
  const PoliceStation({Key? key}) : super(key: key);

  @override
  State<PoliceStation> createState() => _PoliceStationState();
}

class _PoliceStationState extends State<PoliceStation> {
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

      // var result = await pool.execute('''SELECT
      //                                 p.police_station_name,
      //                                 p.police_station_number,
      //                                 c.county_name AS county,
      //                                 p.sub_county,
      //                                 p.ward
      //                             FROM
      //                                 police_station p
      //                             JOIN
      //                                 counties c ON p.county_number = c.county_number''');

      var result = await pool.execute('''SELECT * FROM carownerapp_police_station;''');
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
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'PoliceStation',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySilverAppBar(
              expanded: 200,
              child: Image.asset(
                'assets/images/Police.jpg',
                fit: BoxFit.cover,
              ),
              pinned: true,
              title: Text('POLICE STATION',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              actions: [],
            )
          ],
          body: Center(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                final item = mylist[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Name: ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item['station_name'].toString(),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Sub County: ',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(item['sub_county'].toString(),
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'ward: ',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(item['ward'].toString(),
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(item['Phone_Number'].toString(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          )
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
        ),
        // bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
