import 'dart:convert';

import 'package:bs23_assess/app/core/utils/constants.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';

import 'storage_services.dart';

class GithubStore extends GetxController {
  static GithubStore get to => Get.find();

  Future<void> saveGithubRepo(UiData uiData, String time) async {
    await StorageService.to.setString(
      STORAGE_GITHUB_REPO,
      json.encode(uiData),
    );
  }

  Future<void> saveApiCallTime(String time) async {
    await StorageService.to.setString(STORAGE_LAST_API_CALL, time);
  }
}
