import 'package:bs23_assess/app/core/base/base_controller.dart';
import 'package:bs23_assess/app/data/remote/dashboard_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';

class ProjectDetailsController extends BaseController {
  final DashboardRepository repository =
      Get.find(tag: (DashboardRepository).toString());

  final Rxn<UiData> _projectDetailsUiData = Rxn<UiData>();

  UiData get uiData => _projectDetailsUiData.value!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _projectDetailsUiData.value = Get.arguments;
  }
}
