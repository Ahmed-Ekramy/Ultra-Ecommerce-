import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/string.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.hintText,
      super.key,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.borderRadius,
      this.prefixIconColor,
      this.suffixIconColor,
      this.borderColor,
      this.labelText,
      this.obscureText});

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final double? borderRadius;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? borderColor;
  final Widget? labelText;
  final bool ?obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          labelStyle: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor ?? AppColors.primaryColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: suffixIconColor ?? AppColors.primaryColor,
            size: 20.h,
          ),
          hintStyle: CustomTextStyles.hankenW400S14GrayDark,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(color: Colors.grey, width: 1.2.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.primaryColor, width: 1.2.w),
          )),
    );
  }
}
