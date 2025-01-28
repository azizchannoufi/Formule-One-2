import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:preferences/preferences.dart';

@RoutePage(name: AppRoutes.splashRouteName)
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Démarrage du délai
    Future.delayed(const Duration(seconds: 30), () {
      context.router.replace(const AuthRoute());
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [FoundationColors.primaryColor, FoundationColors.secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            FoundationAssets.f1_logo, // Chemin de l'image
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
