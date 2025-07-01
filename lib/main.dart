import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softwarecontable/screens/coffee_screens/coffee_screen.dart';
import 'package:softwarecontable/providers/analysis_provider_coffee.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnalysisProviderCoffee()),
        // Aquí puedes agregar otros providers si tienes más adelante
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software Contable',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const CoffeeScreen(),
    );
  }
}
