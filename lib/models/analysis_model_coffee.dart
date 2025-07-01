import 'package:flutter/material.dart';

class AnalysisModelCoffee {
  // Paso 1
  bool? desbalance;
  bool correctionNutritional;
  bool correctionPh;

  // Paso 2
  String? tipoTerreno;

  // Paso 3
  int? pendiente;

  // Paso 4
  String? drenaje;

  // Paso 5
  bool? coberturaMaleza;
  Map<String, bool> metodoLimpieza;

  // Paso 6
  String? metodoTrazado;
  String? otroMetodo;

  // Paso 7
  int? profundidadHoyo;
  int? largoHoyo;
  int? anchoHoyo;

  // Paso 8
  double? distanciaEntrePlantas;
  double? distanciaEntreSurcos;

  AnalysisModelCoffee({
    this.desbalance,
    this.correctionNutritional = false,
    this.correctionPh = false,
    this.tipoTerreno,
    this.pendiente,
    this.drenaje,
    this.coberturaMaleza,
    Map<String, bool>? metodoLimpieza,
    this.metodoTrazado,
    this.otroMetodo,
    this.profundidadHoyo,
    this.largoHoyo,
    this.anchoHoyo,
    this.distanciaEntrePlantas,
    this.distanciaEntreSurcos,
  }) : metodoLimpieza = metodoLimpieza ?? {
          'Guadaña': false,
          'Herbicida': false,
          'Asadon': false,
          'Machete': false,
        };

  AnalysisModelCoffee copyWith({
    bool? desbalance,
    bool? correctionNutritional,
    bool? correctionPh,
    String? tipoTerreno,
    int? pendiente,
    String? drenaje,
    bool? coberturaMaleza,
    Map<String, bool>? metodoLimpieza,
    String? metodoTrazado,
    String? otroMetodo,
    int? profundidadHoyo,
    int? largoHoyo,
    int? anchoHoyo,
    double? distanciaEntrePlantas,
    double? distanciaEntreSurcos,
  }) {
    return AnalysisModelCoffee(
      desbalance: desbalance ?? this.desbalance,
      correctionNutritional:
          correctionNutritional ?? this.correctionNutritional,
      correctionPh: correctionPh ?? this.correctionPh,
      tipoTerreno: tipoTerreno ?? this.tipoTerreno,
      pendiente: pendiente ?? this.pendiente,
      drenaje: drenaje ?? this.drenaje,
      coberturaMaleza: coberturaMaleza ?? this.coberturaMaleza,
      metodoLimpieza: metodoLimpieza ?? Map.from(this.metodoLimpieza),
      metodoTrazado: metodoTrazado ?? this.metodoTrazado,
      otroMetodo: otroMetodo ?? this.otroMetodo,
      profundidadHoyo: profundidadHoyo ?? this.profundidadHoyo,
      largoHoyo: largoHoyo ?? this.largoHoyo,
      anchoHoyo: anchoHoyo ?? this.anchoHoyo,
      distanciaEntrePlantas:
          distanciaEntrePlantas ?? this.distanciaEntrePlantas,
      distanciaEntreSurcos: distanciaEntreSurcos ?? this.distanciaEntreSurcos,
    );
  }
}

class AnalysisProviderCoffee with ChangeNotifier {
  AnalysisModelCoffee _data = AnalysisModelCoffee();

  AnalysisModelCoffee get data => _data;

  void update(AnalysisModelCoffee newData) {
    _data = newData;
    notifyListeners();
  }

  void updateField(String field, dynamic value) {
    final updated = _data.copyWith(
      desbalance: field == 'desbalance' ? value : null,
      correctionNutritional:
          field == 'correctionNutritional' ? value : null,
      correctionPh: field == 'correctionPh' ? value : null,
      tipoTerreno: field == 'tipoTerreno' ? value : null,
      pendiente: field == 'pendiente' ? value : null,
      drenaje: field == 'drenaje' ? value : null,
      coberturaMaleza: field == 'coberturaMaleza' ? value : null,
      metodoLimpieza: field == 'metodoLimpieza' ? value : null,
      metodoTrazado: field == 'metodoTrazado' ? value : null,
      otroMetodo: field == 'otroMetodo' ? value : null,
      profundidadHoyo: field == 'profundidadHoyo' ? value : null,
      largoHoyo: field == 'largoHoyo' ? value : null,
      anchoHoyo: field == 'anchoHoyo' ? value : null,
      distanciaEntrePlantas:
          field == 'distanciaEntrePlantas' ? value : null,
      distanciaEntreSurcos: field == 'distanciaEntreSurcos' ? value : null,
    );
    update(updated);
  }
}
