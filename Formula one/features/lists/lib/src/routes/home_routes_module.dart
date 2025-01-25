import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'home_routes_module.gm.dart';
@AutoRouterConfig.module()
class HomeRouteModule extends $HomeRouteModule{
// routes shouldn't be defined here
  final List<AutoRoute> routes = [

  ];
}

@RoutePage(name: AppRoutes.homeTabRouteName)
class HomeTabRoutePage extends AutoRouter {
  const HomeTabRoutePage({super.key});
}






