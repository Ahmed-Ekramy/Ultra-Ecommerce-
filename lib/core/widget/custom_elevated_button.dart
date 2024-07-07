import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/images.dart';
import '../theming/string.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({
    this.buttonName,
    this.backgroundButtonColor,
    this.image,
    this.borderColor,
    this.textColor,
    super.key, this.onPressed, this.width, this.height, this.child,
  });

  final String? buttonName;
  final Color? backgroundButtonColor;
  final String? image;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?? double.infinity,
      height:height?? 56.h,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundButtonColor ?? AppColors.primaryColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: borderColor ?? AppColors.primaryColor, width: 1.w),
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          onPressed: onPressed,
          child:child?? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName ?? "",
                style: CustomTextStyles.hankenW500S14White.copyWith(color: textColor ?? AppColors.whiteColor),
              ),
              Image.asset(
                image ?? AppImages.arrow,
                height: 20.h,
                width: 20.w,
              ),
            ],
          ),),
    );
  }
}