import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAction extends StatelessWidget {
  const AppAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: Get.width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white));
  }
}
