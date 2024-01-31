import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/modules/project_details/controllers/project_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(appBarTitleText: 'Details', isBackButtonEnabled: true),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: controller.uiData.repoName,
                  child: SizedBox(
                    height: Get.height / 10,
                    width: Get.height / 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                          imageUrl: controller.uiData.owner.avatarUrl,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator())),
                    ),
                  ),
                ),
              ),
              Text('Owner: ${controller.uiData.owner.login}',
                  style: const TextStyle(fontSize: 20)),
              Text('Profile Link: ${controller.uiData.owner.url}',
                  style: const TextStyle(fontSize: 20)),
              Text('Repo: ${controller.uiData.repoName}',
                  style: const TextStyle(fontSize: 20)),
              Text('Star Count: ${controller.uiData.starNo}',
                  style: const TextStyle(fontSize: 20)),
              Text(
                  'Updated: ${DateFormat('dd MMM, yyyy').format(controller.uiData.updateDate)}',
                  style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
