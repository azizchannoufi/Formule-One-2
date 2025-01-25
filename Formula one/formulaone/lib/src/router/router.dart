
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:lists/lists.dart';


@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route', modules: [
  HomeRouteModule,

])

class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/Splash',
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: 'HomeTab',
      maintainState: true,
      initial: true,
      page: HomeTabRoute.page,
      children: [
        AutoRoute(
            page: HomePageRoute.page,
            path: AppRoutes.homePagePath,
            initial: true ),
      ],
    ),

    ...HomeRouteModule().routes,
    RedirectRoute(path: '*', redirectTo: '/Splash'),
  ];

  @override
  Map<String, PageFactory> get pagesMap => {
    ...AuthRouteModule().pagesMap,
    ...super.pagesMap,
  };
}