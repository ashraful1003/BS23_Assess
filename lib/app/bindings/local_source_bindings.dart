import 'package:bs23_assess/app/data/remote/dashboard_local_repository.dart';
import 'package:bs23_assess/app/data/remote/github_local_data_source_impl.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardLocalRepository>(() => GithubLocalDataSourceImpl(),
        tag: (DashboardLocalRepository).toString());
  }
}
