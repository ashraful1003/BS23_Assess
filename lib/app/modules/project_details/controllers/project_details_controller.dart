import 'package:bs23_assess/app/core/base/base_controller.dart';
import 'package:bs23_assess/app/data/remote/dashboard_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';

class ProjectDetailsController extends BaseController {
  final DashboardRepository repository =
      Get.find(tag: (DashboardRepository).toString());

  final Rx<UiData> _projectDetailsUiData = UiData().obs;

  UiData get projectDetailsUiData => _projectDetailsUiData.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var dataModel = Get.arguments;
    if (dataModel is UiData) {
      getGithubRepository(dataModel.ownerName, dataModel.repoName);
    }
  }

  void getGithubRepository(userName, repositoryName) {
    callDataService(
      repository.getProject(userName, repositoryName),
      onSuccess: _handleProjectDetailsResponseSuccess,
    );
  }

  void _handleProjectDetailsResponseSuccess(GitHubItem project) {
    _projectDetailsUiData(UiData(
      repoName: project.name,
      ownerName: project.fullName,
      avatar: project.owner.avatarUrl,
      starNo: project.stargazersCount,
      forkNo: project.forks,
      scores: project.score,
      description: project.description,
    ));
  }
}
