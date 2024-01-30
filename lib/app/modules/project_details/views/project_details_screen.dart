import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/modules/project_details/controllers/project_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(appBarTitleText: 'Details', isBackButtonEnabled: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(controller.projectDetailsUiData.ownerName)
          ],
        ),
      ),
    );
  }
}
