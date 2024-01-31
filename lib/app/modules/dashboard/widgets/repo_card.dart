import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:bs23_assess/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({super.key, required this.item});

  final UiData item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROJECT_DETAILS, arguments: item);
      },
      child: Container(
          height: Get.height / 9,
          width: Get.width,
          color: Colors.green,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(item.repoName, style: const TextStyle(fontSize: 20)),
              Text(item.starNo.toString(),
                  style: const TextStyle(fontSize: 20)),
              Text(item.updateDate.toString(),
                  style: const TextStyle(fontSize: 20)),
            ],
          )),
    );
  }
}
