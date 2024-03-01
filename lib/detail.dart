import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class detail extends StatelessWidget {
  const detail({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.parameters['store'] ?? '';
    String product = Get.parameters['product'] ?? '';
    return Scaffold(
      body: Center(
        child: Text("Detail Page" + id + "   Product ID" + product),
      ),
    );
  }
}
