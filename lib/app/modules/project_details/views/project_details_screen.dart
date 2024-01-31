import 'package:bs23_assess/app/core/widgets/custom_app_bar.dart';
import 'package:bs23_assess/app/modules/project_details/controllers/project_details_controller.dart';
import 'package:bs23_assess/app/modules/project_details/widgets/text_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          appBarTitleText: 'Details', isBackButtonEnabled: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                child: Hero(
                  tag: controller.uiData.repoName,
                  child: Container(
                    height: Get.height / 8,
                    width: Get.height / 8,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(color: Colors.green.shade200, width: 2)),
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
              TextWidget(
                  title: 'Profile Link: ', value: controller.uiData.owner.url),
              TextWidget(title: 'Repo: ', value: controller.uiData.repoName),
              TextWidget(
                  title: 'Star Count: ',
                  value: controller.uiData.starNo.toString()),

              TextWidget(
                  title: 'Updated: ',
                  value: DateFormat('dd MMM, yyyy hh:mm a').format(
                      controller.uiData.updateDate)),
              SizedBox(height: 15),
              Text('Description', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Divider(),
              Text(controller.uiData.description,
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
