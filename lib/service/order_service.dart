import 'package:abc_tech_app/model/order.dart';
import 'package:abc_tech_app/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderServiceInterface {
  Future<bool> createOrder(Order order);
}

class OrderService extends GetxService implements OrderServiceInterface {
  final OrderProviderInterface _provider;
  OrderService(this._provider);

  @override
  Future<bool> createOrder(Order order) async {
    Response response = await _provider.postOrder(order);
    if (response.hasError) {
      return Future.error(ErrorDescription("Erro na conexão"));
    }
    try {
      return Future.sync(() => true);
    } catch (e) {
      return Future.error(ErrorDescription("Erro inesperado"));
    }
  }
}
