import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import 'package:pvis/pages/splash.dart';
// import 'package:pvis/auth/login_or_register.dart';
// import 'package:pvis/pages/splash.dart';
// import 'package:pvis/pages/Login_page.dart';
import 'package:pvis/themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: 'pvis',
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            theme: Provider.of<ThemeProvider>(context).themeData,
          );
        });
  }
}
