import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/string.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({this.hintText, super.key, this.prefixIcon, this.suffixIcon,this.keyboardType});
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(color: AppColors.darkGreyColor, fontSize: 14.sp,fontWeight: FontWeight.w600),
          prefixIcon: Icon(prefixIcon, color: AppColors.primaryColor,),
          suffixIcon: Icon(suffixIcon, color: AppColors.primaryColor, size: 20.h,),
          hintStyle: CustomTextStyles.hankenW400S14GrayDark,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey, width: 1.2.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.2.w),
          )),
    );
  }
}

