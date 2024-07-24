import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/theming/images.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';

class CustomListViewSearch extends StatelessWidget {
  const CustomListViewSearch({
    super.key, this.image, required this.name, required this.label, this.price,
  });

  final String? image;
  final String? name;
  final String? label;
  final String? price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        children: [
          Container(
              decoration: const BoxDecoration(color: AppColors.lightGreyColor),
              child:Image.asset(AppImages.jordan, fit: BoxFit.cover, height: 115.h,)
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                price??"",
                style: CustomTextStyles.hankenW700S16Black,
              ),
            ],
          )
        ],
      ),
    );
  }
}