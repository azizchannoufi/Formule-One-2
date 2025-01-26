import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'user_info_routes_module.gm.dart';

@AutoRouterConfig.module()
class UserInfoRouteModule extends $UserInfoRouteModule{
// routes shouldn't be defined here
  final List<AutoRoute> routes = [

  ];
}
@RoutePage(name: AppRoutes.authTabRouteName)
class UserTabRoutePage extends AutoRouter {
  const UserTabRoutePage({super.key});
}






