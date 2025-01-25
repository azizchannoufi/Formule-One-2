import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../domain/usecases/drivers_usecase.dart';
import '../../../domain/usecases/user_usecase.dart';
import '../bloc/home_bloc.dart';
import '../widget/home_page_screen.dart';
import '../widget/widgets.dart';

part 'home_page_props.dart';

@RoutePage(name: AppRoutes.homeRouteName)
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        context.read<GetAllDriversUseCase>(),
        context.read<UserUseCase>(),
      )..add(const Getuser())..add(const Getdrivers()), // Appeler les événements dès le départ
      lazy: false,
      child: this,
    );
  }
}

class _HomePageState extends _HomePageProps {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final userName = state.user.isNotEmpty
                ? "${state.user[0].first_name} ${state.user[0].last_name}"
                : "Good morning";
            return Text(
              "Good morning,\n$userName",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            );
          },
        ),
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/images/Avatar.png",
              width: 67,
              height: 67,
            ),
          ),
        ),
      ),
      body:HomePageScreen(),
    );
  }
}
