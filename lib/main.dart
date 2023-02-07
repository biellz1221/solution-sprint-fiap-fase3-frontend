import 'package:abc_tech_app/pages/home_bind.dart';
import 'package:abc_tech_app/pages/home_page.dart';
import 'package:abc_tech_app/pages/order_bind.dart';
import 'package:abc_tech_app/pages/order_page.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initService();
  runApp(const MyApp());
}

void initService() async {
  await Get.putAsync(() => AssistService().init(AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/", page: () => const OrderPage(), binding: OrderBind()),
        GetPage(name: "/assists", page: () => const HomePage(), binding: HomeBind())
      ],
    );
  }
}
