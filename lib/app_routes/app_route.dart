import 'package:get/route_manager.dart';
import '../constants/app_route_names.dart';
import '../presentation/home/home_screen.dart';

class AppRoute {
  List<GetPage<dynamic>> getAppRoutes() => [
        GetPage(
          name: AppRouteNames.homeScreen,
          page: () => const HomeScreen(),
        )
      ];
}
