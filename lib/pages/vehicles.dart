import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysql_client/mysql_client.dart';

import 'package:pvis/components/my_silverbar.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
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
        databaseName: 'pvis',
      );

      var result = await pool.execute(
          '''SELECT personal.name, personal.id_number, car_details.number_plate,
           car_details.date_of_purchase, car_details.type_of_car
          FROM personal
           JOIN car_details ON personal.id_number = car_details.personal_id
           WHERE personal.id_number = 10000008''');
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
        //     'VEHICLES',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySilverAppBar(
              expanded: 0,
              // child: Image.asset('assets/images/car.jpg',fit: BoxFit.cover,),
              child: Container(),
              pinned: true,
              title: Text('Vehicles',
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Number Plate: ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                item['number_plate'].toString(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Name: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                              Text(item['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Model: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                              Text(item['type_of_car'].toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              // Text('Registration: ',
                              //     style: TextStyle(
                              //         fontSize: 10,
                              //         fontWeight: FontWeight.bold)),
                              Text(item['date_of_purchase'].toString(),
                                  style: TextStyle(
                                    letterSpacing: -1,
                                      fontSize: 9,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/kbb.jpg'),
                                fit: BoxFit.cover)
                            // image:
                            ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
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
