import 'package:flutter/material.dart';
import 'package:softwarecontable/utils/constants.dart';

class CoffeeScreen2 extends StatefulWidget {
  const CoffeeScreen2({super.key});

  @override
  State<CoffeeScreen2> createState() => _CoffeeScreen2State();
}

class _CoffeeScreen2State extends State<CoffeeScreen2> {
  String? tipoMateriaPrima;
  String cantidadEstimada = '';
  Map<String, bool> procesosMateriaPrima = {
    'Siembra': false,
    'Fertilización': false,
    'Poda': false,
    'Mantenimiento del cultivo': false,
    'Cosecha': false,
    'Otro': false,
  };
  String otroProceso = '';
  Map<String, bool> cotizacionOpciones = {
    'Proveedores frecuentes ya registrados en el sistema': false,
    'Recomendación de otros productores o empresas': false,
    'Búsqueda en internet (páginas web, redes sociales, directorios)': false,
    'Ferias o eventos comerciales del sector': false,
    'Contacto directo de visitas previas o llamadas': false,
    'Otro (especifique)': false,
  };
  String otroMetodoCotizacion = '';
  bool? analisisCotizacion;
  Map<String, bool> criteriosCotizacion = {
    'Precio': false,
    'Tiempo de entrega': false,
    'Calidad de producto': false,
    'Condiciones de pago': false,
    'Otros': false,
  };
  String otroCriterioCotizacion = '';
  String? transporteResponsable;
  String otroTransporte = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 2: Especificaciones Técnicas')),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selección de variedad planta/fruto:', style: kTituloPaso),
                const SizedBox(height: 16),
                const Text('¿Qué tipo de materia prima se requiere?', style: kSubtitulo),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Ej: Caturra, Castillo, Tabi...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => tipoMateriaPrima = value),
                ),
                const SizedBox(height: 24),
                const Text('¿Cantidad estimada necesaria? (unidades o kilos)', style: kSubtitulo),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    hintText: 'Ej: 5000 plantas o 300 kg',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => cantidadEstimada = value),
                ),
                const SizedBox(height: 30),
                Text('¿Qué áreas o procesos solicitan la materia prima?', style: kTituloPaso),
                ...procesosMateriaPrima.keys.map((proceso) => CheckboxListTile(
                      title: Text(proceso),
                      value: procesosMateriaPrima[proceso],
                      onChanged: (value) => setState(() => procesosMateriaPrima[proceso] = value ?? false),
                    )),
                if (procesosMateriaPrima['Otro'] == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Especificar otro proceso',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() => otroProceso = value),
                    ),
                  ),
                const SizedBox(height: 30),
                Text('¿Cómo consigue proveedores para cotizaciones?', style: kTituloPaso),
                ...cotizacionOpciones.keys.map((opcion) => CheckboxListTile(
                      title: Text(opcion),
                      value: cotizacionOpciones[opcion],
                      onChanged: (value) => setState(() => cotizacionOpciones[opcion] = value ?? false),
                    )),
                if (cotizacionOpciones['Otro (especifique)'] == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Especificar otro método de contacto con proveedores',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() => otroMetodoCotizacion = value),
                    ),
                  ),
                const SizedBox(height: 30),
                Text('¿Se realizó análisis comparativo de cotizaciones?', style: kTituloPaso),
                ListTile(
                  title: const Text('Sí'),
                  leading: Radio<bool>(
                    value: true,
                    groupValue: analisisCotizacion,
                    onChanged: (value) => setState(() => analisisCotizacion = value),
                  ),
                ),
                ListTile(
                  title: const Text('No'),
                  leading: Radio<bool>(
                    value: false,
                    groupValue: analisisCotizacion,
                    onChanged: (value) => setState(() => analisisCotizacion = value),
                  ),
                ),
                if (analisisCotizacion == false)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Recomendación: Cambio de proveedor',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red[700]),
                    ),
                  ),
                if (analisisCotizacion == true) ...[
                  const SizedBox(height: 16),
                  const Text('¿Qué criterio desea priorizar en la comparación de cotizaciones?', style: kSubtitulo),
                  ...criteriosCotizacion.keys.map((criterio) => CheckboxListTile(
                        title: Text(criterio),
                        value: criteriosCotizacion[criterio],
                        onChanged: (value) => setState(() => criteriosCotizacion[criterio] = value ?? false),
                      )),
                  if (criteriosCotizacion['Otros'] == true)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Especificar otro criterio',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => setState(() => otroCriterioCotizacion = value),
                      ),
                    ),
                  const SizedBox(height: 30),
                  Text('¿Quién gestionará el transporte de la materia prima?', style: kTituloPaso),
                  RadioListTile<String>(
                    title: const Text('Proveedor'),
                    value: 'Proveedor',
                    groupValue: transporteResponsable,
                    onChanged: (value) => setState(() {
                      transporteResponsable = value;
                      otroTransporte = '';
                    }),
                  ),
                  RadioListTile<String>(
                    title: const Text('Empresa contratante'),
                    value: 'Empresa contratante',
                    groupValue: transporteResponsable,
                    onChanged: (value) => setState(() {
                      transporteResponsable = value;
                      otroTransporte = '';
                    }),
                  ),
                  RadioListTile<String>(
                    title: const Text('Otro'),
                    value: 'Otro',
                    groupValue: transporteResponsable,
                    onChanged: (value) => setState(() => transporteResponsable = value),
                  ),
                  if (transporteResponsable == 'Otro')
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Especifique quién gestionará el transporte',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => setState(() => otroTransporte = value),
                      ),
                    ),
                ],
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Aquí puedes enlazar CoffeeScreen3 si está lista
                // Navigator.push(context, MaterialPageRoute(builder: (_) => CoffeeScreen3()));
              },
              child: const Text('Siguiente'),
            ),
          ),
        ],
      ),
    );
  }
}
