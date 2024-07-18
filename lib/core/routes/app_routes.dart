import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/core/routes/routing.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';
import 'package:ultra/feature/product_details/presentation/pages/product_details_view.dart';
import '../../feature/forget_password/presentation/pages/verify_code_view.dart';
import '../../feature/forget_password/presentation/pages/verify_email_view.dart';
import '../../feature/forget_password/presentation/pages/verify_password_view.dart';
import '../../feature/home/data/models/product_model.dart';
import '../../feature/home/presentation/pages/home_layout.dart';
import '../../feature/login/presentation/pages/login_view.dart';
import '../../feature/product_details/presentation/manager/product_details_cubit.dart';
import '../../feature/profile/presentation/pages/profile_view.dart';
import '../../feature/reset_password/presentation/pages/reset_email.dart';
import '../../feature/reset_password/presentation/pages/reset_password_view.dart';
import '../../feature/sign_up/presentation/pages/sign_up_view.dart';
import '../di/injection.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.resetEmail:
        return MaterialPageRoute(builder: (_) => const ResetEmailView());

      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmailView());
      case Routes.verifyPassword:
        return MaterialPageRoute(builder: (_) => const VerifyPasswordView());
      case Routes.verifyCode:
        return MaterialPageRoute(builder: (_) => const VerifyCodeView());
      case Routes.productDetails:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return const ProductDetailsView();
            });
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
