import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/theming/string.dart';
import 'package:ultra/core/widget/custom_text_form_field.dart';

import '../../../../core/routes/routing.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                'Profile',
                style: CustomTextStyles.hankenW600S18Black,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff386692),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTextFormField(
                      keyboardType: TextInputType.name,
                      hintText: "First Name",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Last Name",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTextFormField(
                      keyboardType: TextInputType.name,
                      hintText: "Last Name",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Email",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Password",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      suffixIcon: Icons.visibility_off_outlined,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Phone Number",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      hintText: "Phone Number",
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.resetEmail);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reset password",
                        style: CustomTextStyles.hankenW600S18Black,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Divider(
                  thickness: 1.h,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shoe Size",
                      style: CustomTextStyles.hankenW600S18Black,
                    ),
                    Text(
                      "42 EUR",
                      style: CustomTextStyles.hankenW600S14Primary,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Divider(
                  thickness: 1.h,
                ),
              ),
            ),
          ]),
    );
  }
}
