import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toonflix',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
