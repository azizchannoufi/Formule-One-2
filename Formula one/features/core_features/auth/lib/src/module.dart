import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UserInfoModule implements BaseModule {
  @override
  void inject(GetIt getIt) {

  }

  @override
  void initAdapters() {}

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {
      // Routes data in module
    };
  }
}