import 'package:bs23_assess/app/data/remote/dashboard_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';
import 'package:bs23_assess/app/core/base/base_controller.dart';

class DashboardController extends BaseController {
  final DashboardRepository repository =
      Get.find(tag: (DashboardRepository).toString());

  @override
  void onInit() {
    super.onInit();
    getGithubRepoList();
  }

  Rx<List<UiData>> githubItemsController = Rx<List<UiData>>([]);

  List<UiData> get githubItems => githubItemsController.value.toList();

  void getGithubRepoList() {
    print('am i called1');
    var queryParams = SearchQueryParam(searchKeyWord: 'Flutter', perPage: 10);

    var githubRepoService = repository.getGithubRepos(queryParams);
    callDataService(githubRepoService, onSuccess: _handleGithubRepoList);
  }

  void _handleGithubRepoList(GithubItemModel itemModel) {
    List<UiData>? repoList = itemModel.items
        .map((e) => UiData(
            repoName: e.name,
            ownerName: e.owner.login,
            starNo: e.stargazersCount,
            scores: e.score))
        .toList();

    githubItemsController(repoList);
  }
}
