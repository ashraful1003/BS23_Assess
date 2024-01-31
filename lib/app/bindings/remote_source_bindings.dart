import 'package:bs23_assess/app/data/remote/dashboard_remote_repository.dart';
import 'package:bs23_assess/app/data/remote/github_remote_data_source_impl.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardRemoteRepository>(() => GithubRemoteDataSourceImpl(),
        tag: (DashboardRemoteRepository).toString());
  }
}
