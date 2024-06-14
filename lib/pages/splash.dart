

import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:pvis/auth/login_or_register.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).colorScheme.primary,
      splash: Lottie.asset('assets/images/splash2.json',width: 150, height: 150),
      // splash: Center(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: 150,
      //         height: 150,
      //         decoration: BoxDecoration(
      //             // color: Colors.amber,
      //             borderRadius: BorderRadius.circular(150),
      //             image: const DecorationImage(
      //                 image: AssetImage('assets/images/kca.jpg'),
      //                 fit: BoxFit.cover)
      //             // image:
      //             ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       if (Platform.isIOS)
      //         const CupertinoActivityIndicator(
      //           radius: 15,
      //         )
      //       else
      //         CircularProgressIndicator(
      //           color: Theme.of(context).colorScheme.inversePrimary,
      //        strokeWidth: 2,
      //         ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Text(
      //         'Welcome to PVIS',
      //         style: TextStyle(
      //             color: Theme.of(context).colorScheme.inversePrimary,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold),
      //       )
      //     ],
      //   ),
      // ),
      duration: 400,
      nextScreen: LoginOrRegister(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
    );
  }
}
