import 'dart:convert';

import 'package:app_endcep_ft/models/cep_model.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  static const String _baseUrl = 'https://viacep.com.br/ws/';
  final http.Client client;

  CepRepository({required this.client});

  Future<CepModel> consultarCep(String cep) async {
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanCep.length != 8) {
      throw Exception('CEP inválido');
    }

    final url = Uri.parse('$_baseUrl/$cleanCep/json');
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('erro')) {
          throw Exception('CEP não encontrado');
        }
        return CepModel.fromJson(jsonData);
      } else {
        throw Exception('Erro ao consultar CEP');
      }
    } on Exception catch (e) {
      throw Exception('Erro ao consultar CEP: $e');
    }
  }
}
