import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(appBarTitleText: 'GitHub Repo List'),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.githubItems.length,
          itemBuilder: (context, index) {
            return Text(controller.githubItems[index].repoName);
          }),
    );
  }
}

