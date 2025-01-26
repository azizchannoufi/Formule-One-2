import 'package:core/core.dart';
import 'splash_routes_module.gm.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig.module()
class SplashRouteModule extends $SplashRouteModule{
// routes shouldn't be defined here
  final List<AutoRoute> routes = [

  ];
}
@RoutePage(name: AppRoutes.splashTabRouteName)
class SplashTabRoutePage extends AutoRouter {
  const SplashTabRoutePage({super.key});
}






