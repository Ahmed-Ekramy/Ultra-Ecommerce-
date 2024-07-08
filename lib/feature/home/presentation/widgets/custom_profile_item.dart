import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key, this.icon, required this.name, required this.label,
  });

  final Icon? icon;
  final String name;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        children: [
          Container(
              decoration: const BoxDecoration(color: AppColors.lightGreyColor),
              child:icon
          ),
          SizedBox(
            width: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name??"",
                style: CustomTextStyles.hankenW700S16Black,
              ),
              SizedBox(
                width: 0.h,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                label??"",
                style: CustomTextStyles.hankenW400S14GrayDark,
              ),
            ],
          )
        ],
      ),
    );
  }
}