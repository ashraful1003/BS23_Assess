import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/core/widgets/paging_view.dart';
import 'package:bs23_assess/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bs23_assess/app/modules/dashboard/widgets/app_action.dart';
import 'package:bs23_assess/app/modules/dashboard/widgets/repo_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: 'GitHub Repo List',
        isCenterTitle: false,
        actions: [AppAction(controller: controller)],
      ),
      body: PagingView(
        onLoadNextPage: () {
          controller.onLoadNextPage();
        },
        child: Column(
          children: [
            Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.githubItems.length,
                itemBuilder: (context, index) {
                  return RepoCard(item: controller.githubItems[index]);
                })),
          ],
        ),
      ),
    );
  }
}
