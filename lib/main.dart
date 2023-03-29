import 'package:flutter/material.dart';
import 'package:mobigic_test/core/core_colors.dart';
import 'package:mobigic_test/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CoreColors.primaryBlack,
      ),
      home: const SplashScreen(),
    );
  }
}
