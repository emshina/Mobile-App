import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';


class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<Map<String, dynamic>> mylist = [];
  List<String> countyNames = []; // Store only county names

  @override
  void initState() {
    super.initState();
    fetchPoliceStations();
  }

  Future<void> fetchPoliceStations() async {
    try {
      final pool = MySQLConnectionPool(
        host: 'localhost',
        port: 3306,
        userName: 'root',
        password: '?00chin@',
        maxConnections: 10,
        databaseName: 'pvis',
      );

      var result = await pool.execute('''SELECT
                                      p.police_station_name,
                                      p.police_station_number,
                                      c.county_name AS county,
                                      p.sub_county,
                                      p.ward
                                  FROM
                                      police_station p
                                  JOIN
                                      counties c ON p.county_number = c.county_number''');

      for (final row in result.rows) {
        mylist.add(row.assoc());
        countyNames
            .add(row.colByName('county').toString()); // Extract county names
      }
      pool.close();
    } catch (e) {
      print('Error: $e');
    }
    setState(() {}); // Trigger a rebuild after data fetching
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Display the dropdown with county names
      items: countyNames.map((String county) {
        return DropdownMenuItem(
          value: county,
          child: Text(county),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {});
      },
    );
  }
}
