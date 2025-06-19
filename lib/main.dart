import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/coffee_screens/coffee_screen.dart';
import 'screens/orange_screens/orange_screen.dart';

void main() {
  runApp(SoilAnalysisApp());
}

class SoilAnalysisApp extends StatelessWidget {
  const SoilAnalysisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Análisis de Suelo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/analysis_coffee': (context) => CoffeeScreen(),
        '/analysis_orange': (context) => OrangeScreen(),
      },
    );
  }
}