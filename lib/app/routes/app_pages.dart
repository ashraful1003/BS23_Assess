import 'package:bs23_assess/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:bs23_assess/app/modules/dashboard/views/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
