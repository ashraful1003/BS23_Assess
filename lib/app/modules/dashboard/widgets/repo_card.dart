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
      onTap: () {
        Get.toNamed(Routes.PROJECT_DETAILS, arguments: item);
      },
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5),
          width: Get.width,
          color: Colors.green,
          alignment: Alignment.center,
          child: Row(
            children: [
              Hero(
                tag: item.repoName,
                child: SizedBox(
                  height: Get.height / 15,
                  width: Get.height / 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl: item.owner.avatarUrl,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator())),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Owner: ${item.owner.login}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Repo: ${item.repoName}',
                      style: const TextStyle(fontSize: 20)),
                  Text('Star Count: ${item.starNo}',
                      style: const TextStyle(fontSize: 20)),
                  Text(
                      'Updated: ${DateFormat('dd MMM, yyyy').format(item.updateDate)}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ],
          )),
    );
  }
}
