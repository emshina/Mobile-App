import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:pvis/components/my_silverbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MySilverAppBar(
                    expanded: 200,
                      pinned: true,
                      title: Text('PROFILE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                      actions: [],
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Muchina Paul Kamau',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ))
                ],
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 28,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              const Text('email'
                                ,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('emshinapaul@gmail.com', style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 28,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('0791672871',style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.book,
                            size: 28,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Identification Number',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('38942205', style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.map,
                            size: 28,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country Of Residence',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('Kenya',style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}