import 'package:abc_tech_app/controller/order_controller.dart';
import 'package:abc_tech_app/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  Widget _renderAssists(List<Assist> assists) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assists.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(assists[index].name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            controller.removeAssistFromList(assists[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (state) => buildForm(context),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Preencha o fomulário de ordem de serviço",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: controller.operatorIdController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Código Prestador"),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      "Selecione as assistências a serem realizadas:",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.orange),
                  width: 40,
                  height: 40,
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () => controller.selectAssists(),
                  ),
                ),
              ],
            ),
            Obx(() => _renderAssists(controller.selectedAssists)),
            Row(
              children: [
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller.operatorIdController,
                  builder: (context, value, child) {
                    return Expanded(
                      child: ElevatedButton(
                        onPressed: value.text.isNotEmpty ? controller.finishStartOrder : null,
                        child: Obx(() {
                          if (controller.screenState.value == OrderState.creating) {
                            return const Text("Iniciar");
                          } else {
                            return const Text("Finalizar");
                          }
                        }),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
