import 'package:bs23_assess/app/modules/project_details/controllers/project_details_controller.dart';
import 'package:get/get.dart';

class ProjectDetailsBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProjectDetailsController());
  }
}