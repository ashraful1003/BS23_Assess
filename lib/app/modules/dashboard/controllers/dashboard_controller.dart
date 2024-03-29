import 'package:bs23_assess/app/core/base/paging_controller.dart';
import 'package:bs23_assess/app/data/preferences/github_store.dart';
import 'package:bs23_assess/app/data/remote/dashboard_local_repository.dart';
import 'package:bs23_assess/app/data/remote/dashboard_remote_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';
import 'package:bs23_assess/app/modules/dashboard/models/ui_data.dart';
import 'package:bs23_assess/app/routes/app_pages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  RxBool isNetAvailable = false.obs;
  RxBool isTimeToFetch = false.obs;
  DateTime? lastApiCall;

  @override
  void onInit() {
    super.onInit();
    sortItems.value = ['Updated Date', 'Star Count'];

    netAvailable()
        .then((value) => timeDiff().then((value) => getGithubRepoListRemote()));
  }

  Rx<List<UiData>> githubItemsController = Rx<List<UiData>>([]);

  List<UiData> get githubItems => githubItemsController.value.toList();

  Future<void> netAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet) {
      isNetAvailable(true);
    } else {
      isNetAvailable(false);
    }
  }

  Future<void> timeDiff() async {
    String getTime = localRepository.getTime();
    if (getTime.isNotEmpty) {
      lastApiCall = DateTime(int.parse(getTime));
      Duration duration = const Duration(seconds: 30);
      DateTime subTime = DateTime.now().subtract(duration);
      if (lastApiCall != null) isTimeToFetch(lastApiCall!.isAfter(subTime));
    }
  }

  void getGithubRepoListRemote() async {
    if (!pagingController.value.canLoadNextPage()) return;

    pagingController.value.isLoadingPage = true;

    if (isNetAvailable.value || isTimeToFetch.value) {
      var queryParams = SearchQueryParam(
          searchKeyWord: 'Flutter',
          pageNumber: pagingController.value.pageNumber);

      var githubRepoService = remoteRepository.getGithubRepos(queryParams);
      callDataService(githubRepoService,
          onError: (e){print(e.toString());},
          onSuccess: _handleGithubRepoListRemote);
    } else {
      if (!isTimeToFetch.value) {
        /// first with no internet
        Get.toNamed(Routes.NO_INTERNET);
      } else {
        var localData = await localRepository.getGithubRepos();
        _handleGithubRepoListLocal(localData);
      }
    }

    pagingController.value.isLoadingPage = false;
  }

  onLoadNextPage() {
    getGithubRepoListRemote();
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (githubItems.length + newListItemCount) >= totalCount;
  }

  void _handleGithubRepoListRemote(GithubItemModel itemModel) {
    List<UiData>? repoList = itemModel.items
        .map((e) => UiData(
            repoName: e.name,
            owner: e.owner,
            starNo: e.stargazersCount,
            scores: e.score,
            forkNo: e.forksCount,
            updateDate: e.updatedAt,
            description: e.description))
        .toList();

    print(repoList.length);

    if (_isLastPage(repoList.length, itemModel.totalCount)) {
      pagingController.value.appendLastPage(repoList);
    } else {
      pagingController.value.appendPage(repoList);
    }

    githubItemsController.value = [...pagingController.value.listItems];

    GithubStore().saveGithubRepo(itemModel);

    /// save current time
    GithubStore().saveApiCallTime(DateTime.now().millisecondsSinceEpoch);

    update();
  }

  void _handleGithubRepoListLocal(GithubItemModel itemModel) {
    List<UiData>? repoList = itemModel.items
        .map((e) => UiData(
            repoName: e.name,
            owner: e.owner,
            starNo: e.stargazersCount,
            scores: e.score,
            forkNo: e.forksCount,
            updateDate: e.updatedAt,
            description: e.description))
        .toList();

    githubItemsController(repoList);
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
