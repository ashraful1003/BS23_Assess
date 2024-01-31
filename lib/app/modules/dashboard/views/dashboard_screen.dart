import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/core/widgets/paging_view.dart';
import 'package:bs23_assess/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bs23_assess/app/modules/dashboard/widgets/app_action.dart';
import 'package:bs23_assess/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitleText: 'GitHub Repo List',
        isCenterTitle: false,
        actions: [
          AppAction(),
        ],
      ),
      body: PagingView(
        onLoadNextPage: () {
          controller.onLoadNextPage();
        },
        child: Obx(() => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.githubItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROJECT_DETAILS,
                      arguments: controller.githubItems[index]);
                },
                child: Container(
                    height: Get.height / 9,
                    width: Get.width,
                    color: index % 2 == 0 ? Colors.green : Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(controller.githubItems[index].repoName,
                        style: const TextStyle(fontSize: 20))),
              );
            })),
      ),
    );
  }
}
