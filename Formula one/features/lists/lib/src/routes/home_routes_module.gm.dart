// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:lists/src/presentation/home/pages/home_page.dart' as _i1;
import 'package:lists/src/routes/home_routes_module.dart' as _i2;

abstract class $HomeRouteModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i1.HomePage()),
      );
    },
    ListTabRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeTabRoutePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class ListRoute extends _i3.PageRouteInfo<void> {
  const ListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeTabRoutePage]
class ListTabRoute extends _i3.PageRouteInfo<void> {
  const ListTabRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ListTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListTabRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
