import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';

class   CustomShimmerProduct extends StatelessWidget {
  const CustomShimmerProduct ({super.key});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: SizedBox(
        child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child:
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Container(
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
                              child: Container(
                                height: 100.h,
                                width: 150.h,
                                decoration: const BoxDecoration(
                                    color: AppColors.lightGreyColor
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 10.h,
                              width: 150.w,
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreyColor
                              ),
                            ),

                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 5.h,
                                  width: 50.w,
                                  decoration: const BoxDecoration(
                                      color: AppColors.lightGreyColor
                                  ),

                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  height: 5.h,
                                  width: 100.w,
                                  decoration: const BoxDecoration(
                                      color: AppColors.lightGreyColor
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                              child: Container(
                                height: 10.h,
                                width: 150.h,
                                decoration: const BoxDecoration(
                                    color: AppColors.lightGreyColor
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(left:  30.0.w) ,
                              height:20.h,
                              width: 150.h,
                              decoration: const BoxDecoration(
                                  color: AppColors.lightGreyColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
        ),
      ),

    );
  }
}
