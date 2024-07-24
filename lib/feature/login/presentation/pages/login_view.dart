import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/network/network_exceptions.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/images.dart';
import 'package:ultra/feature/login/presentation/manager/login_cubit.dart';
import 'package:ultra/feature/login/presentation/manager/login_state.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../widgets/custom_email_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState<dynamic>>(
      listenWhen: (previous, current) =>
      current is Loading ||
          current is Success || current is Error,
      listener: (context, state) {
        state.maybeWhen(
            loading: () {
              showDialog(
                context: context,
                builder: (context) => const Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryColor
              )) );
            }, success: (value) {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            },
            error: ( NetworkExceptions value) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    value.toString(),
                    style: CustomTextStyles.hankenW700S14Primary,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Got it',
                        style: CustomTextStyles.hankenW700S14Primary,
                      ),
                    ),
                  ],
                ),
              );
            },
          orElse: () {},
        );
      },
      child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.only(top: 60.0.h, right: 20.w, left: 20.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: CustomTextStyles.hankenW400S45Black,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Sign in and Enjoy Latest Offers",
                        style: CustomTextStyles.hankenW400S14Black,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomEmailPassword(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.verifyEmail);
                          },
                          child: Text(
                            "Forget Password?",
                            style: CustomTextStyles.hankenW400S12Black,
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomElevationButton(
                        onPressed: () {
                          //validateThenDoLogin(context);
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.home, (route) => false);
                        },
                        buttonName: "Login",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                          child:
                          Text("OR",
                              style: CustomTextStyles.hankenW400S14Black)),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomElevationButton(
                        buttonName: "Continue with Google",
                        image: AppImages.google,
                        backgroundButtonColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomElevationButton(
                        buttonName: "Continue with Apple",
                        image: AppImages.apple,
                        backgroundButtonColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomElevationButton(
                        buttonName: "Continue with Facebook",
                        image: AppImages.facebook,
                        backgroundButtonColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: CustomTextStyles.hankenW400S12Black,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.register);
                              },
                              child: Text(
                                "Sign Up",
                                style: CustomTextStyles.hankenW600S12Primary,
                              ))
                        ],
                      ),

                    ]

                ),

              ),
            ),
          )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (LoginCubit.get(context)
        .formKey
        .currentState!
        .validate()) {
      context.read<LoginCubit>().login();
    }
  }
}