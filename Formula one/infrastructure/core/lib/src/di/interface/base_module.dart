import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
/// Module base should implemented
///
/// Must implement :
///
/// - Dependency Injection
/// - Routing
///
abstract class BaseModule {
  /// Make routes from your module
  ///
  /// Example use:
  ///
  /// ```dart
  /// {
  ///   '/home': MaterialPageRoute(builder: (_) => HomePage()),
  ///   '/login': CupertinoPageRoute(builder: (_) => LoginPage()),
  /// ]
  /// ```
  Map<String, Route> routes(RouteSettings settings);

  /// Inject Hive Object Adapters
  void initAdapters();

  /// Inject all source
  ///
  /// - Singleton
  /// - Factory
  void inject(GetIt getIt);
}



