import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class VerifyPasswordView extends StatelessWidget {
  const VerifyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:AppBar(
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
      ) ,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your New Password and confirm it.",
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "New Password",
              style: CustomTextStyles.hankenW400S14GrayDark,
            ),
            SizedBox(
              height: 10.h,
            ),
             const CustomTextFormField(
              hintText: "New Password",
suffixIcon: Icons.visibility_off_sharp,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Confirm Password",
              style: CustomTextStyles.hankenW400S14GrayDark,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextFormField(
              hintText: 'Confirm Password',
              suffixIcon: Icons.visibility_off_sharp,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.h,
            ),

            CustomElevationButton(
              buttonName: 'Save',
              onPressed: () {

              },
            ),

          ],
        ),
      ),
    );
  }
}
