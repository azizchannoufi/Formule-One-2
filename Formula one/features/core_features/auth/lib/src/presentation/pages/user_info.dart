import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../domain/usecases/usercreate_usecase.dart';
import '../bloc/userinfo_bloc.dart';
import '../widget/user_info_screen.dart';
import '../widget/widgets.dart';
import 'package:core/core.dart';

part 'user_info_props.dart';

@RoutePage(name: AppRoutes.authRouteName)
class UserInfoPage extends StatefulWidget implements AutoRouteWrapper {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserinfoBloc>(
      create: (context) => UserinfoBloc(context.read<UserCreatUseCase>()),
      lazy: false,
      child: this,
    );
  }
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserInfoAppBar(),
      body: BlocBuilder<UserinfoBloc, UserinfoState>(
        builder: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            Future.delayed(Duration.zero, () {
              context.router.pushNamed('/home');
            });
          }

          if (state.status == FormzSubmissionStatus.failure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage ?? 'Erreur inconnue')),
              );
            });
          }

          return UserInfoScreen(
            firstNameController: TextEditingController(),
            lastNameController: TextEditingController(),
            isValid: state.isValid,
            onSubmit: () {
              context.read<UserinfoBloc>().add(Submit());
            },
          );
        },
      ),
    );
  }
}
