import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Your Identity',
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
              "Enter your email to receive reset Code",
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
                Navigator.pushNamed(context, Routes.verifyCode);
              },

            )
          ],
        ),
      ),
    );
  }
}
