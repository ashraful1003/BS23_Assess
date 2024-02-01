import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
            'There is nothing in cache! Please Enable your Internet to fetch data.'),
      ),
    );
  }
}
