import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w,),
          width: 380.w,
          height: 170.h,
          decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Buy Outfit of the\n month now ",
                style: CustomTextStyles.hankenW600S24White
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "And get 20% discount ",
                style: CustomTextStyles.hankenW400S10LightGray
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h,),
              CustomElevationButton(
                width: 130.w,
                height: 50.h,
                borderColor: AppColors.blackColor,
                backgroundButtonColor: Colors.white,
                textColor: AppColors.primaryColor,
                onPressed: () {},
                child: Text("Buy Now",style: CustomTextStyles.hankenW600S12Primary,),
              )
            ],
          ),
        ),
        Positioned(
            left: 220.w,
            bottom: 0.h,
            child: Image.asset(AppImages.man, )),
      ],
    );
  }
}