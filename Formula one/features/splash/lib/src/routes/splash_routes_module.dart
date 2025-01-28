import 'package:core/core.dart';
import 'splash_routes_module.gm.dart';
import 'package:dependencies/dependencies.dart';

@AutoRouterConfig.module()
class SplashRouteModule extends $SplashRouteModule{
// routes shouldn't be defined here
  final List<AutoRoute> routes = [
    AutoRoute(
      path: AppRoutes.splashTabPath,
      page: SplashRoute.page,
      initial: true,
    ),
  ];
}
@RoutePage(name: AppRoutes.splashTabRouteName)
class SplashTabRoutePage extends AutoRouter {
  const SplashTabRoutePage({super.key});
}






