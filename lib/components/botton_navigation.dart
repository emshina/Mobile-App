// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:pvis/pages/charges.dart';
// // import 'package:pvis/pages/home_page.dart';
// // import 'package:pvis/pages/vehicles.dart';
// import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({Key? key}) : super(key: key);

//   @override
//   _BottomNavState createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   // final Color navigationBarColor = Theme.of(context).colorScheme.onPrimary;
//   int selectedIndex = 0;
//   late PageController pageController;

  
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(initialPage: selectedIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WaterDropNavBar(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       onItemSelected: (int index) {
//         setState(() {
//           selectedIndex = index;
//         });
//         pageController.animateToPage(selectedIndex,
//             duration: const Duration(milliseconds: 400),
//             curve: Curves.easeOutQuad);
//       },
//       selectedIndex: selectedIndex,
//       barItems: <BarItem>[
//         BarItem(
//           filledIcon: Icons.home_rounded,
//           outlinedIcon: Icons.home_outlined,
//         ),
//         BarItem(
//             filledIcon: Icons.apartment_sharp,
//             outlinedIcon: Icons.apartment_outlined),
//         BarItem(
//           filledIcon: Icons.notification_add_rounded,
//           outlinedIcon: Icons.notification_add_outlined,
//         ),
//         BarItem(
//           filledIcon: Icons.message_rounded,
//           outlinedIcon: Icons.messenger_outline,
//         ), 
      
        
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pvis/pages/charges.dart';
import 'package:pvis/pages/home_page.dart';
import 'package:pvis/pages/police_station.dart';
import 'package:pvis/pages/vehicles.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            HomePage(),
            Charges(),
            Vehicles(),
            PoliceStation(),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius:  BorderRadius.vertical(top:  Radius.circular(16)),
          child: WaterDropNavBar(
            waterDropColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_outlined,
                
          
              ),
              BarItem(
                  filledIcon: Icons.message_rounded,
                  outlinedIcon: Icons.message_outlined),
              BarItem(
                filledIcon: Icons.car_rental_rounded,
                outlinedIcon: Icons.car_rental_outlined,
              ),
              BarItem(
                filledIcon: Icons.apartment_rounded,
                outlinedIcon: Icons.apartment_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


