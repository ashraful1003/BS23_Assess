import 'package:bs23_assess/app/data/remote/dashboard_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';
import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements DashboardRepository {
  @override
  Future<GithubItemModel> getGithubRepos(
      SearchQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/search/repositories";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubRepoResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GitHubItem> getProject(String userName, String repositoryName) {
    var endpoint = "${DioProvider.baseUrl}/repos/$userName/$repositoryName";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  GithubItemModel _parseGithubRepoResponse(
      Response<dynamic> response) {
    return GithubItemModel.fromJson(response.data);
  }

  GitHubItem _parseGithubProjectResponse(Response<dynamic> response) {
    return GitHubItem.fromJson(response.data);
  }
}
