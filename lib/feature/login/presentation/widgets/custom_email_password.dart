import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/feature/login/presentation/widgets/password_validation.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../manager/login_cubit.dart';
import '../manager/login_state.dart';

class CustomEmailPassword extends StatelessWidget {
  const CustomEmailPassword({super.key});

  final bool isObscureText = true;
  final bool hasLowercase = false;
  final bool hasUppercase = false;
  final bool hasSpecialCharacters = false;
  final bool hasNumber = false;
  final bool hasMinLength = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return Form(
        key: LoginCubit.get(context).formKey,
        child: Column(children: [
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
              if (value == null ||
                  value.isEmpty ) {
                return 'Please enter a valid password';
              }

            },
            obscureText: LoginCubit.get(context).isObscured,
            controller: LoginCubit.get(context).passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            prefixIcon: Icons.password,
            suffixIcon: GestureDetector(
              onTap: () {
                LoginCubit.get(context).changeObscure();
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
        ]));
  },
);
  }
}
