import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/analysis_screen.dart';

void main() {
  runApp(SoilAnalysisApp());
}

class SoilAnalysisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Análisis de Suelo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/analysis': (context) => AnalysisScreen(),
      },
    );
  }
}