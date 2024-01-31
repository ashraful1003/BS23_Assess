import 'package:bs23_assess/app/core/base/paging_controller.dart';
import 'package:bs23_assess/app/data/remote/dashboard_local_repository.dart';
import 'package:bs23_assess/app/data/remote/dashboard_remote_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:get/get.dart';
import 'package:bs23_assess/app/core/base/base_controller.dart';

class DashboardController extends BaseController {
  final DashboardRemoteRepository remoteRepository =
      Get.find(tag: (DashboardRemoteRepository).toString());

  final DashboardLocalRepository localRepository =
      Get.find(tag: (DashboardLocalRepository).toString());

  Rx<PagingController<UiData>> pagingController =
      PagingController<UiData>().obs;

  Rx<List<String>> sortItems = Rx<List<String>>([]);
  RxString sortType = ''.obs;
  RxString text = "".obs;

  @override
  void onInit() {
    super.onInit();
    sortItems.value = ['Updated Date', 'Star Count'];
    getGithubRepoListRemote();
  }

  Rx<List<UiData>> githubItemsController = Rx<List<UiData>>([]);

  List<UiData> get githubItems => githubItemsController.value.toList();

  void getGithubRepoListRemote() {
    if (!pagingController.value.canLoadNextPage()) return;

    pagingController.value.isLoadingPage = true;

    var queryParams = SearchQueryParam(searchKeyWord: 'Flutter', pageNumber: pagingController.value.pageNumber);

    var githubRepoService = remoteRepository.getGithubRepos(queryParams);
    callDataService(githubRepoService, onSuccess: _handleGithubRepoList);

    pagingController.value.isLoadingPage = false;
  }

  onLoadNextPage() {
    getGithubRepoListRemote();
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (githubItems.length + newListItemCount) >= totalCount;
  }

  void _handleGithubRepoList(GithubItemModel itemModel) {
    List<UiData>? repoList = itemModel.items
        .map((e) => UiData(
              repoName: e.name,
              owner: e.owner,
              starNo: e.stargazersCount,
              scores: e.score,
              updateDate: e.updatedAt,
            ))
        .toList();

    if (_isLastPage(repoList.length, itemModel.totalCount)) {
      pagingController.value.appendLastPage(repoList);
    } else {
      pagingController.value.appendPage(repoList);
    }

    var newList = [...pagingController.value.listItems];

    githubItemsController(newList);
  }

  void changeSortItemValue(val) {
    sortType.value = val;
    var newList = githubItemsController.value.toList();
    if (sortType.value.compareTo('Star Count') == 0) {
      newList.sort((item1, item2) => item2.starNo.compareTo(item1.starNo));
    } else {
      newList
          .sort((item1, item2) => item2.updateDate.compareTo(item1.updateDate));
    }
    githubItemsController(newList);
    update();
  }
}
