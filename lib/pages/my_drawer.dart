import 'package:flutter/material.dart';
import 'package:pvis/pages/calender.dart';
import 'package:pvis/pages/charges.dart';
import 'package:pvis/pages/my_drawerTile.dart';
import 'package:pvis/pages/police_station.dart';
import 'package:pvis/pages/profile.dart';
import 'package:pvis/pages/settings.dart';
import 'package:pvis/pages/vehicles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor:theme,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              accountName: Text("Muchina Paul"),
              accountEmail: Text("emshinapaul@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
          MyDrawerTile(
              text: 'HOME',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              }),
          MyDrawerTile(
              text: 'VEHICLES',
              icon: Icons.car_rental,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Vehicles()));
              }),
          MyDrawerTile(
              text: 'NOTIFICATIONS',
              icon: Icons.notifications,
              onTap: () {
                Navigator.pop(context);
              }),
          MyDrawerTile(
              text: 'POLICESTATION',
              icon: Icons.apartment,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PoliceStation()));
              }),
          MyDrawerTile(
              text: 'CHARGES',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Charges()),
                );
              }),
          MyDrawerTile(
              text: 'CALENDER',
              icon: Icons.calendar_month,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TableBasicsExample()),
                );
              }),
          MyDrawerTile(
              text: 'PROFILE',
              icon: Icons.people,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Profile()),
                );
              }),
          MyDrawerTile(
              text: 'SETTINGS',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              }),
          // const Spacer(),
          // Expanded(child: SizedBox()),
          SizedBox(
            height: 70,
          ),
          MyDrawerTile(
              text: 'LOGOUT',
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
