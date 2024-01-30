import 'package:bs23_assess/app/bindings/remote_source_bindings.dart';
import 'package:bs23_assess/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RemoteSourceBindings().dependencies();
    Get.lazyPut(() => DashboardController());
  }
}
