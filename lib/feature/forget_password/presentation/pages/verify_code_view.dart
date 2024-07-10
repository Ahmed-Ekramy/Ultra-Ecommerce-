import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routing.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

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
              "We`ve sent an email to y******@g****.com",
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextFormField(
              hintText: 'Enter Code',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomElevationButton(
              buttonName: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, Routes.verifyPassword);
              },

            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "Did not receive code? ",
                  style: CustomTextStyles.hankenW400S14GrayDark,
                ),
                TextButton(
                  onPressed: () {
                  },
                child: Text(  "Resend",
                  style: CustomTextStyles.hankenW600S14Primary,)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
