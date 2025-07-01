import 'package:flutter/material.dart';
import 'package:softwarecontable/models/analysis_model_coffee.dart';

class AnalysisProviderCoffee extends ChangeNotifier {
  AnalysisModelCoffee _data = AnalysisModelCoffee();

  AnalysisModelCoffee get data => _data;

  // Métodos para actualizar cada campo
  void setDesbalance(bool? value) {
    _data.desbalance = value;
    notifyListeners();
  }

  void setCorrectionNutritional(bool value) {
    _data.correctionNutritional = value;
    notifyListeners();
  }

  void setCorrectionPh(bool value) {
    _data.correctionPh = value;
    notifyListeners();
  }

  void setTipoTerreno(String value) {
    _data.tipoTerreno = value;
    notifyListeners();
  }

  void setPendiente(int value) {
    _data.pendiente = value;
    notifyListeners();
  }

  void setDrenaje(String value) {
    _data.drenaje = value;
    notifyListeners();
  }

  void setCoberturaMaleza(bool? value) {
    _data.coberturaMaleza = value;
    notifyListeners();
  }

  void toggleMetodoLimpieza(String metodo, bool value) {
    _data.metodoLimpieza[metodo] = value;
    notifyListeners();
  }

  void setMetodoTrazado(String value) {
    _data.metodoTrazado = value;
    notifyListeners();
  }

  void setOtroMetodo(String value) {
    _data.otroMetodo = value;
    notifyListeners();
  }

  void setDimensionesHoyo({int? profundidad, int? largo, int? ancho}) {
    if (profundidad != null) _data.profundidadHoyo = profundidad;
    if (largo != null) _data.largoHoyo = largo;
    if (ancho != null) _data.anchoHoyo = ancho;
    notifyListeners();
  }

  void setDistancias({double? entrePlantas, double? entreSurcos}) {
    if (entrePlantas != null) _data.distanciaEntrePlantas = entrePlantas;
    if (entreSurcos != null) _data.distanciaEntreSurcos = entreSurcos;
    notifyListeners();
  }

  // Método para resetear todo (opcional)
  void reset() {
    _data = AnalysisModelCoffee();
    notifyListeners();
  }
}
