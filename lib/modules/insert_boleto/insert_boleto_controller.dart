import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel boletoModel = BoletoModel();
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  Future<void> saveBoleto() async {
    try {
      final intance = await SharedPreferences.getInstance();
      final boletos = intance.getStringList('boletos') ?? <String>[];
      boletos.add(boletoModel.toJson());

      await intance.setStringList('boletos', boletos);
    } catch (e) {}
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return saveBoleto();
    }
  }

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    boletoModel = boletoModel.copyWith(
        name: name, barcode: barcode, dueDate: dueDate, value: value);
  }
}
