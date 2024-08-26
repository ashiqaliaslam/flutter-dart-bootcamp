import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      //   primaryColor: const Color(0xFF0A0E21),
      //   scaffoldBackgroundColor: const Color(0xFF0A0E21),
      //   textTheme: const TextTheme(
      //     bodyMedium: TextStyle(color: Colors.white),
      //   ),
      // ),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
