import 'package:flutter/material.dart';
import 'package:softwarecontable/screens/coffee_screens/coffee_screem2.dart';
import 'package:softwarecontable/utils/constants.dart';

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
  Map<String, bool> metodoLimpieza = {
    'Guadaña': false,
    'Herbicida': false,
    'Asadon': false,
    'Machete': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 1: Análisis de Suelo')),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding, kDefaultPadding, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('¿Hay desbalances o pH fuera de rango?', style: kTituloPaso),
                ListTile(
                  title: const Text('Sí'),
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
                  title: const Text('No'),
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
                    title: const Text('Corrección nutricional (Deficiencia de nutrientes)'),
                    value: correctionNutritional,
                    onChanged: (value) {
                      setState(() {
                        correctionNutritional = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Corrección de pH (Ajuste de acidez o alcalinidad)'),
                    value: correctionPh,
                    onChanged: (value) {
                      setState(() {
                        correctionPh = value ?? false;
                      });
                    },
                  ),
                ],
                const SizedBox(height: kDefaultPadding),
                Text('Identificación del tipo de terreno:', style: kTituloPaso),
                ...tiposTerreno.map(
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
                const SizedBox(height: kDefaultPadding),
                Text('Evaluación de la pendiente del terreno:', style: kTituloPaso),
                ...[
                  'Plana (0-3%)',
                  'Suave (4-8%)',
                  'Moderada (9-15%)',
                  'Fuerte (16-25%)',
                  'Muy fuerte (>25%)',
                  'No evaluado',
                ].asMap().entries.map(
                  (entry) => RadioListTile<int>(
                    title: Text(entry.value),
                    value: entry.key + 1,
                    groupValue: pendiente,
                    onChanged: (value) {
                      setState(() {
                        pendiente = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Text('Verificación del drenaje:', style: kTituloPaso),
                ...['Bueno', 'Moderado', 'Deficiente', 'No evaluado'].map(
                  (value) => RadioListTile<String>(
                    title: Text(value),
                    value: value,
                    groupValue: drenaje,
                    onChanged: (val) {
                      setState(() {
                        drenaje = val;
                      });
                    },
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Text('¿Cobertura de maleza > 40%?', style: kTituloPaso),
                ListTile(
                  title: const Text('Sí'),
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
                  title: const Text('No'),
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
                if (coberturaMaleza != null) ...[
                  if (coberturaMaleza == true) ...[
                    const SizedBox(height: 8),
                    Text('¿Cómo realizará la limpieza?', style: kSubtitulo),
                    ...metodoLimpieza.keys.map(
                      (key) => CheckboxListTile(
                        title: Text(key == 'Asadon'
                            ? 'Limpieza manual con asadón'
                            : key == 'Machete'
                                ? 'Limpieza manual con machete'
                                : key),
                        value: metodoLimpieza[key],
                        onChanged: (value) {
                          setState(() {
                            metodoLimpieza[key] = value ?? false;
                          });
                        },
                      ),
                    ),
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        kRecomendacionManual,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kSuccessColor,
                        ),
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: kDefaultPadding),
                Text('Selección del método de trazado:', style: kTituloPaso),
                ...['Cuadrado', 'Rectangular', 'Triángulos', 'Tres bolillos', 'Curvas a nivel', 'Otro'].map(
                  (metodo) => RadioListTile<String>(
                    title: Text(metodo),
                    value: metodo,
                    groupValue: metodoTrazado,
                    onChanged: (value) {
                      setState(() {
                        metodoTrazado = value;
                        otroMetodo = '';
                      });
                    },
                  ),
                ),
                if (metodoTrazado == 'Otro')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TextField(
                      decoration: const InputDecoration(
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
                const SizedBox(height: kDefaultPadding),
                Text('Dimensiones de los hoyos para el ahoyado (en centímetros):', style: kTituloPaso),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
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
                const SizedBox(height: kDefaultPadding),
                Text('¿Qué distancia se utilizará para la siembra? (en metros)', style: kTituloPaso),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
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
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Distancia entre calles (m)',
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
          Positioned(
            bottom: kDefaultPadding,
            right: kDefaultPadding,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeeScreen2(),
                  ),
                );
              },
              child: const Text('Siguiente'),
            ),
          ),
        ],
      ),
    );
  }
}
