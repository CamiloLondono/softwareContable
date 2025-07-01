import 'package:flutter/material.dart';

/// 🌈 Colores base de la app
const kPrimaryColor = Color(0xFF3A5A40); // Verde café
const kAccentColor = Color(0xFF588157);  // Verde suave
const kTextColor = Colors.black87;
const kErrorColor = Colors.redAccent;
const kSuccessColor = Colors.green;
const kBackgroundColor = Color(0xFFF7F7F7);

/// 📐 Tamaños comunes
const kDefaultPadding = 16.0;
const kCardRadius = 12.0;

/// 📝 Text Styles reutilizables
const kTituloPaso = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kSubtitulo = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const kTextoNormal = TextStyle(
  fontSize: 16,
);

/// 🧾 Etiquetas y textos comunes
const kOtro = 'Otro';
const kEspecifiqueOtro = 'Especifique otro';
const kRecomendacionManual = 'Recomendación: Limpieza manual';
const kRecomendacionHerbicida = 'Recomendación: Limpieza con guadaña + herbicida';

/// 🔽 Listas comunes
const List<String> tiposTerreno = [
  'Franco',
  'Arenoso',
  'Arcilloso',
  'Limoso',
  'Pedregoso',
  'Franco-arenoso',
  'Franco-arcilloso',
];

const List<String> criteriosComparacion = [
  'Precio',
  'Tiempo de entrega',
  'Calidad de producto',
  'Condiciones de pago',
  'Otros',
];