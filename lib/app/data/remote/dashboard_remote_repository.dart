import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';
import 'package:bs23_assess/app/modules/dashboard/models/search_query_params.dart';

abstract class DashboardRemoteRepository {
  Future<GithubItemModel> getGithubRepos(SearchQueryParam queryParam);
}
