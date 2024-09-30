import 'package:flutter/material.dart';
import 'package:pr4/pages/drinks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ПР4 ПКС',
      home: DrinksPage(),
    );
  }
}
