import 'package:bs23_assess/app/core/base/base_remote_source.dart';
import 'package:bs23_assess/app/core/utils/constants.dart';
import 'package:bs23_assess/app/data/preferences/storage_services.dart';
import 'package:bs23_assess/app/data/remote/dashboard_local_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';

class GithubLocalDataSourceImpl extends BaseRemoteSource
    implements DashboardLocalRepository {
  @override
  Future<GithubItemModel> getGithubRepos() {
    try {
      return fetchLocalWithErrorParser(
              StorageService.to.getString(STORAGE_GITHUB_REPO))
          .then((response) => _parseGithubRepoResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getTime() {
    try {
      return StorageService.to.getString(STORAGE_LAST_API_CALL);
    } catch (e) {
      rethrow;
    }
  }

  GithubItemModel _parseGithubRepoResponse(response) {
    return GithubItemModel.fromJson(response);
  }
}
