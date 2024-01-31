import 'package:bs23_assess/app/modules/dashboard/models/github_item_model.dart';

abstract class DashboardLocalRepository {
  Future<GithubItemModel> getGithubRepos();
}
