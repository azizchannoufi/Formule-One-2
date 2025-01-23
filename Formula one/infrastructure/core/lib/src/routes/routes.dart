import 'package:auto_route/auto_route.dart';
import 'package:core/src/routes/routes.gr.dart';



@AutoRouterConfig()
class Routes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: UserInfoRoute.page,initial: true),
    AutoRoute(page: HomeRoute.page),
  ];
}


