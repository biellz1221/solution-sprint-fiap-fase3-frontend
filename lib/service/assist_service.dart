import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class AssistService extends GetxService {
  late AssistProviderInterface _assistProvider;

  Future<List<Assist>> getAssists() async {
    Response response = await _assistProvider.getAssist();
    if (response.hasError) {
      return Future.error(ErrorDescription("Erro de Conexão"));
    }
    try {
      List<Assist> listResult =
          response.body.map<Assist>((item) => Assist.fromMap(item)).toList();
      return Future.sync(() => listResult);
    } catch (e) {
      e.printInfo();
      return Future.error(
          ErrorDescription("Houve um erro ao ler o corpo da requisição"));
    }
  }

  Future<AssistService> init(AssistProviderInterface providerInterface) async {
    _assistProvider = providerInterface;
    return this;
  }
}
