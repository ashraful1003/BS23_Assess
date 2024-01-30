import 'package:bs23_assess/app/my_app.dart';
import 'package:bs23_assess/flavors/build_config.dart';
import 'package:bs23_assess/flavors/env_config.dart';
import 'package:bs23_assess/flavors/environment.dart';
import 'package:flutter/material.dart';

void main() {
  EnvConfig prodConfig = EnvConfig(
    appName: "BS23 Asses QA",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.QA,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
