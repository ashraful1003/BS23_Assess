import 'dart:convert';

import 'package:bs23_assess/app/core/utils/constants.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';

import 'storage_services.dart';

class GithubStore extends GetxController {
  static GithubStore get to => Get.find();

  Future<void> saveGithubRepo(GithubItemModel githubItemModel) async {
    await StorageService.to
        .setString(STORAGE_GITHUB_REPO, json.encode(githubItemModel));
  }

  Future<void> saveApiCallTime(String time) async {
    await StorageService.to.setString(STORAGE_LAST_API_CALL, time);
  }
}
