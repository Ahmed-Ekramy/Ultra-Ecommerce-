import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/routes/routing.dart';
import 'package:ultra/core/theming/colors.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../manager/sign_up_cubit.dart';
import '../manager/sign_up_state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            showDialog(
                context: context,
                builder: (context) => const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor)));
          }
          else if (state is SignUpSuccess) {
            {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
          }
          else if (state is SignUpError) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 32,
                      ),
                      content: Text(state.error),
                    ));
          }
        },
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.only(top: 60.0.h, right: 20.w, left: 20.w),
              child: Form(
                key: context.read<SignUpCubit>().formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Join With Us",
                        style: CustomTextStyles.hankenW400S45Black,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "4.000.000 + Shoes Already to buy or sell",
                        style: CustomTextStyles.hankenW400S14Black,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid full name";
                          }
                          return null;
                        },
                        controller: SignUpCubit.get(context).fullNameController,
                        keyboardType: TextInputType.name,
                        hintText: "Full Name",
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        validator: (p0) {
                          if (p0 == null || p0.length < 11 || p0.isEmpty) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                        controller: SignUpCubit.get(context).phoneController,
                        keyboardType: TextInputType.number,
                        hintText: " Phone",
                        prefixIcon: Icons.phone,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                        },
                        controller: SignUpCubit.get(context).emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        obscureText: SignUpCubit.get(context).isObscured,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isPasswordValid(value)) {
                            return 'Please enter a valid password';
                          }
                        },
                        controller: SignUpCubit.get(context).passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Password",
                        prefixIcon: Icons.password,
                        suffixIcon: InkWell(
                          onTap: () => SignUpCubit.get(context).changeObscure(),
                          child: Icon(
                            SignUpCubit.get(context).isObscured
                                ? Icons.visibility_off_sharp
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomElevationButton(
                        onPressed: () => validateThenDoSignUp(context),
                        buttonName: "Sign Up",
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
                                Navigator.pushNamed(context, Routes.login);
                              },
                              child: Text(
                                "Sign In",
                                style: CustomTextStyles.hankenW600S12Primary,
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (SignUpCubit.get(context).formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
