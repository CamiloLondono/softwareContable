import 'package:flutter/material.dart';

class OrangeScreen extends StatefulWidget {
  const OrangeScreen({super.key});

  @override
  State<OrangeScreen> createState() => _OrangeScreenState();
}

class _OrangeScreenState extends State<OrangeScreen> {
  bool? desbalance;
  bool correctionNutritional = false;
  bool correctionPh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paso 1: Análisis de Suelo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Hay desbalances o pH fuera de rango?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Sí'),
              leading: Radio<bool>(
                value: true,
                groupValue: desbalance,
                onChanged: (value) {
                  setState(() {
                    desbalance = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('No'),
              leading: Radio<bool>(
                value: false,
                groupValue: desbalance,
                onChanged: (value) {
                  setState(() {
                    desbalance = value;
                  });
                },
              ),
            ),
            if (desbalance == true) ...[
              CheckboxListTile(
                title: Text('Corrección nutricional'),
                value: correctionNutritional,
                onChanged: (value) {
                  setState(() {
                    correctionNutritional = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Corrección de pH'),
                value: correctionPh,
                onChanged: (value) {
                  setState(() {
                    correctionPh = value ?? false;
                  });
                },
              ),
            ],
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Aquí continuarías al siguiente paso (pantalla 2)
                // Navigator.pushNamed(context, '/terrainType');
              },
              child: Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}