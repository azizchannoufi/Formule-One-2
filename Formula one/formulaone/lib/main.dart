import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:formulaone/src/router/router.dart';
import 'package:formulaone/src/router/router.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser()
    );
  }
}
