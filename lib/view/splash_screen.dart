import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobigic_test/core/core_colors.dart';
import 'package:mobigic_test/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: CoreColors.primaryBlack,
      duration: 2000,
      splashIconSize: size.width,
      splash: const Center(
        child: Text(
          'Mobigic',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white70,
          ),
        ),
      ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
