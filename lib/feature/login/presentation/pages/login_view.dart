import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/theming/images.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.only(top: 60.0.h, right: 20.w, left: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              prefixIcon: Icons.email,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              prefixIcon: Icons.password,
              suffixIcon: Icons.visibility_off,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Forget Password?",
                  style: CustomTextStyles.hankenW400S12Black,
                )),
            SizedBox(
              height: 15.h,
            ),
            const CustomElevationButton(
              buttonName: "Login",
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
                child: Text("OR", style: CustomTextStyles.hankenW400S14Black)),
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
            )
          ]),
        ),
      ),
    ));
  }
}
