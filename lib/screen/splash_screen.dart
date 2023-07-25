import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 100,
        splash: Image.asset("assets/images/instagram.png"),
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.decoratedBoxTransition,
        backgroundColor: Colors.white);
  }
}
