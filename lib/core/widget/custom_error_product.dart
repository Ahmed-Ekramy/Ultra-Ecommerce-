import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/string.dart';

class CustomErrorProduct extends StatelessWidget {
   const CustomErrorProduct( this.dioException, {  super.key});
   final String dioException;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder:  (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Container(
                width: 250.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.lightGreyColor, width: 1.w),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Icon (
                            Icons.error,
                            color: Colors.red,
                            size: 50.sp,
                          )
                      ),
                      Text(
                        "$dioException ",
                        style: CustomTextStyles.hankenW600S18Black
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
