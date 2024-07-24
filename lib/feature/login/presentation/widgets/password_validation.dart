
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/string.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        SizedBox ( height: 2.w,),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        SizedBox ( height: 2.w,),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        SizedBox ( height: 2.w,),
        buildValidationRow('At least 1 number', hasNumber),
        SizedBox ( height: 2.w,),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.greyColor,
        ),
     SizedBox ( width: 10.w,),
        Text(
          text,
          style: CustomTextStyles.hankenW400S14Black.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ?  AppColors.greyColor :  AppColors.blueColor
          ),
        )
      ],
    );
  }
}
