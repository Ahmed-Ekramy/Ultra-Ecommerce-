import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/thiming/images.dart';

import '../../../../core/thiming/colors.dart';
import '../../../../core/thiming/string.dart';
import '../../../../core/wigdet/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0.h, right: 20.w, left: 20.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            const CustomTextFormField(),
            SizedBox(
              height: 15.h,
            ),
            const CustomTextFormField(),
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
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primaryColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: CustomTextStyles.hankenW500S14White,
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(child: Text("OR", style: CustomTextStyles.hankenW400S14Black)),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.whiteColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.blackColor, width: 1.w),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Continue with Google",
                          style: CustomTextStyles.hankenW500S14Black),
                      Image.asset(
                        AppImages.google,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.whiteColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.blackColor, width: 1.w),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Continue with apple",
                          style: CustomTextStyles.hankenW500S14Black),
                      Image.asset(
                        AppImages.apple,
                        height: 30.h,
                        width: 25.w,
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.whiteColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.blackColor, width: 1.w),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Continue with Facebook",
                          style: CustomTextStyles.hankenW500S14Black),
                      Image.asset(
                        AppImages.facebook,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  )),
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
                    onPressed: () {},
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
