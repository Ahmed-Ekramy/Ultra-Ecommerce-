import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/widget/custom_elevated_button.dart';

import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class ResetEmailView extends StatelessWidget {
  const ResetEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: CustomTextStyles.hankenW600S18Black,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xff386692)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.0.h),
        child: Column(
          children: [
            Text(
              'Enter your email address. You will receive a link to create a new password via email.',
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextFormField(
              prefixIcon: Icons.email,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomElevationButton(
              buttonName: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, Routes.resetPassword);
              },

            )
          ],
        ),
      ),
    );
  }
}
