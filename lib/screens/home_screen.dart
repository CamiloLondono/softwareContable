import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio - Análisis de Suelo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/analysis_coffee');
              },
              child: Text('Análisis Café'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/analysis_orange');
              },
              child: Text('Análisis Naranja'),
            ),
          ],
        ),
      ),
    );
  }
}
