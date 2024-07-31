import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/images.dart';
import 'package:ultra/feature/login/presentation/manager/login_cubit.dart';
import 'package:ultra/feature/login/presentation/manager/login_state.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginLoadingState ||
            current is LoginSuccessState ||
            current is LoginErrorState,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor)));
          } else if (state is LoginSuccessState) {
            print(state.loginModel.accessToken);
            CacheHelper.saveData(key: "UserId", value: state.loginModel.id);
            CacheHelper.saveData(key: "User", value: state.loginModel.accessToken);
            Fluttertoast.showToast(
                msg: "Login Successful",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.home, (route) => false);
          } else if (state is LoginErrorState) {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Login Failed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  state.error.toString(),
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
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 60.0.h, right: 20.w, left: 20.w),
                  child: Form(
                    key: context.read<LoginCubit>().formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !AppRegex.isEmailValid(value)) {
                                return 'Please enter a valid email';
                              }
                            },
                            controller: LoginCubit.get(context).emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                            prefixIcon: Icons.email,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid password';
                              }
                            },
                            obscureText: LoginCubit.get(context).isObscured,
                            controller:
                                LoginCubit.get(context).passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Password",
                            prefixIcon: Icons.password,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                LoginCubit.get(context).changeLoginObscure();
                              },
                              child: Icon(
                                LoginCubit.get(context).isObscured
                                    ? Icons.visibility_off_sharp
                                    : Icons.visibility,
                                size: 20.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.verifyEmail);
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
                              validateThenDoLogin(context);

                            },
                            buttonName: "Login",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                              child: Text("OR",
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
                                    Navigator.pushNamed(
                                        context, Routes.register);
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style:
                                        CustomTextStyles.hankenW600S12Primary,
                                  ))
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void validateThenDoLogin(BuildContext context) {
    if (LoginCubit.get(context).formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
