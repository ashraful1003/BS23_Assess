import 'package:bs23_assess/app/core/values/app_values.dart';
import 'package:bs23_assess/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAction extends StatelessWidget {
  const AppAction({super.key, required this.controller});

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: Get.width/2.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      alignment: Alignment.centerLeft,
      child: Obx(() {
        List<String> items = controller.sortItems.value;
        return DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          value: controller.sortType.value == ""
              ? null
              : controller.sortType.value,
          isExpanded: true,
          iconEnabledColor: Colors.grey.shade400,
          underline: const SizedBox(),
          hint: const Text("Sort By"),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(
                items,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: AppValues.iconSize_14,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            controller.changeSortItemValue(newValue!);
          },
        );
      }),
    );
  }
}
