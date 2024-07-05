
import 'package:flutter/material.dart';
import 'package:ultra/core/routes/routing.dart';
import '../../feature/login/presentation/pages/login_view.dart';
import '../../feature/sign_up/presentation/pages/sign_up_view.dart';
class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
            case Routes.register:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
