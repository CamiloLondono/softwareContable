import 'package:flutter/material.dart';
import 'package:softwarecontable/screens/coffee_screens/coffee_screem2.dart';

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
  bool? coberturaMaleza;
  String? metodoTrazado;
  String otroMetodo = '';
  int? profundidadHoyo;
  int? largoHoyo;
  int? anchoHoyo;
  double? distanciaEntrePlantas;
  double? distanciaEntreSurcos;

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
                // Paso 5
                Text(
                  '¿Cobertura de maleza > 40%?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: Text('Sí'),
                  leading: Radio<bool>(
                    value: true,
                    groupValue: coberturaMaleza,
                    onChanged: (value) {
                      setState(() {
                        coberturaMaleza = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'),
                  leading: Radio<bool>(
                    value: false,
                    groupValue: coberturaMaleza,
                    onChanged: (value) {
                      setState(() {
                        coberturaMaleza = value;
                      });
                    },
                  ),
                ),
                coberturaMaleza != null
                    ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        coberturaMaleza == true
                            ? 'Recomendación: Limpieza con guadaña + herbicida'
                            : 'Recomendación: Limpieza manual',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green[700],
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                // Paso 6
                SizedBox(height: 30),
                Text(
                  'Selección del método de trazado:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...[
                  'Cuadrado',
                  'Rectangular',
                  'Triángulos',
                  'Tres bolillos',
                  'Curvas a nivel',
                  'Otro',
                ].map(
                  (metodo) => RadioListTile<String>(
                    title: Text(metodo),
                    value: metodo,
                    groupValue: metodoTrazado,
                    onChanged: (value) {
                      setState(() {
                        metodoTrazado = value;
                        otroMetodo = ''; // Reiniciar si escoge algo diferente
                      });
                    },
                  ),
                ),
                if (metodoTrazado == 'Otro')
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Especificar otro método',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          otroMetodo = value;
                        });
                      },
                    ),
                  ),
                // Paso 7
                SizedBox(height: 30),
                Text(
                  'Dimensiones de los hoyos para el ahoyado (en centímetros):',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Profundidad (cm)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        profundidadHoyo = int.tryParse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Largo (cm)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        largoHoyo = int.tryParse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ancho (cm)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        anchoHoyo = int.tryParse(value);
                      });
                    },
                  ),
                ),
                //Paso 7
                SizedBox(height: 30),
                Text(
                  '¿Qué distancia se utilizará para la siembra? (en metros)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Distancia entre plantas (m)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        distanciaEntrePlantas = double.tryParse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Distancia entre surcos (m)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        distanciaEntreSurcos = double.tryParse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Botón fijo en la esquina inferior derecha
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeeScreen2(),
                  ),
                );
              },
              child: Text('Siguiente'),
            ),
          ),
        ],
      ),
    );
  }
}
