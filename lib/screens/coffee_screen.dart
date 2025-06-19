import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});

  @override
  State<CoffeeScreen> createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CoffeeScreen> {
  bool? desbalance;
  bool correctionNutritional = false;
  bool correctionPh = false;
  String? terreno;
  int? pendiente;
  String? drenaje;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paso 1: Análisis de Suelo')),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Paso 1
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
                    title: Text(
                      'Corrección nutricional (Deficiencia de nutrientes)',
                    ),
                    value: correctionNutritional,
                    onChanged: (value) {
                      setState(() {
                        correctionNutritional = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Corrección de pH (Ajuste de acidez o alcalinidad)',
                    ),
                    value: correctionPh,
                    onChanged: (value) {
                      setState(() {
                        correctionPh = value ?? false;
                      });
                    },
                  ),
                ],
                const SizedBox(height: 30),
                // Paso 2
                Text(
                  'Identificación del tipo de terreno:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...[
                  'Franco',
                  'Arenoso',
                  'Arcilloso',
                  'Limoso',
                  'Pedregoso',
                  'Franco-arenoso',
                  'Franco-arcilloso',
                ].map(
                  (tipo) => RadioListTile<String>(
                    title: Text(tipo),
                    value: tipo,
                    groupValue: terreno,
                    onChanged: (value) {
                      setState(() {
                        terreno = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                // Paso 3
                Text(
                  'Evaluación de la pendiente del terreno:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RadioListTile<int>(
                  title: Text('Plana (0-3%)'),
                  value: 1,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Suave (4-8%)'),
                  value: 2,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Moderada (9-15%)'),
                  value: 3,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Fuerte (16-25%)'),
                  value: 4,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('Muy fuerte (>25%)'),
                  value: 5,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('No evaluado'),
                  value: 6,
                  groupValue: pendiente,
                  onChanged: (value) {
                    setState(() {
                      pendiente = value;
                    });
                  },
                ),
                SizedBox(height: 30),
                // Paso 4
                Text(
                  'Verificación del drenaje:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RadioListTile<String>(
                  title: Text('Bueno'),
                  value: 'Bueno',
                  groupValue: drenaje,
                  onChanged: (value) {
                    setState(() {
                      drenaje = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Moderado'),
                  value: 'Moderado',
                  groupValue: drenaje,
                  onChanged: (value) {
                    setState(() {
                      drenaje = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Deficiente'),
                  value: 'Deficiente',
                  groupValue: drenaje,
                  onChanged: (value) {
                    setState(() {
                      drenaje = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('No evaluado'),
                  value: 'No evaluado',
                  groupValue: drenaje,
                  onChanged: (value) {
                    setState(() {
                      drenaje = value;
                    });
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),

          // Botón fijo en la esquina inferior derecha
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Lógica del siguiente paso
              },
              child: Text('Siguiente'),
            ),
          ),
        ],
      ),
    );
  }
}
