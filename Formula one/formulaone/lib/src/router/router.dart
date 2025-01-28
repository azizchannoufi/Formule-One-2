
import 'package:auth/auth.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:lists/lists.dart';
import 'package:splash/splash.dart';
import 'package:formulaone/src/router/router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route', modules: [
  HomeRouteModule,

])

class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    ...UserInfoRouteModule().routes,
    ...HomeRouteModule().routes,
    ...SplashRouteModule().routes,
    RedirectRoute(path: '*', redirectTo: '/Splash'),
  ];

}