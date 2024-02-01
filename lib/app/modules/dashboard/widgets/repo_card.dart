import 'package:bs23_assess/app/core/values/app_values.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:bs23_assess/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({super.key, required this.item});

  final UiData item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Hero(
                tag: '${item.owner.login}${item.repoName}',
                child: SizedBox(
                  height: Get.height / 15,
                  width: Get.height / 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl: item.owner.avatarUrl,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator())),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _getDetails(),
            ],
          )),
    );
  }

  Widget _getDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width / 1.5,
          child: Text('Owner: ${item.owner.login}',
              softWrap: true,
              style: const TextStyle(fontSize: AppValues.iconSize_18)),
        ),
        SizedBox(
          width: Get.width / 1.5,
          child: Text('Repo: ${item.repoName}',
              softWrap: true,
              style: const TextStyle(fontSize: AppValues.iconSize_18)),
        ),
        Text('Star Count: ${item.starNo}',
            style: const TextStyle(fontSize: AppValues.iconSize_18)),
        SizedBox(
          width: Get.width / 1.5,
          child: Text(
              'Updated: ${DateFormat('dd MMM, yyyy').format(item.updateDate)}',
              style: const TextStyle(fontSize: AppValues.iconSize_18)),
        ),
      ],
    );
  }

  void _onTap() {
    Get.toNamed(Routes.PROJECT_DETAILS, arguments: item);
  }
}
