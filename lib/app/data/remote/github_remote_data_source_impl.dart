import 'package:bs23_assess/app/data/remote/dashboard_remote_repository.dart';
import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';
import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements DashboardRemoteRepository {
  @override
  Future<GithubItemModel> getGithubRepos(SearchQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/search/repositories";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubRepoResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  GithubItemModel _parseGithubRepoResponse(Response<dynamic> response) {
    // print(response.data);
    return GithubItemModel.fromJson(response.data);
  }
}
