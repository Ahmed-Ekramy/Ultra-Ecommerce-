import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';

class CustomListMakeUp extends StatelessWidget {
  const CustomListMakeUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Container(
              width: 200.w,
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
                    Image.asset(
                      AppImages.garnier,
                      width: double.infinity,
                      height: 115.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Garnier Pure Active",
                        style: CustomTextStyles.hankenW700S16Black),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "skin care ",
                          style: CustomTextStyles
                              .hankenW400S14GrayDark
                              .copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "700000 EGP",
                          style: CustomTextStyles
                              .hankenW700S12LightGray
                              .copyWith(
                              fontWeight: FontWeight.bold,
                              decoration:
                              TextDecoration.lineThrough,
                              decorationColor:
                              AppColors.darkGreyColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "500000 EGP",
                      style: CustomTextStyles.hankenW600S18Black
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150.w,
                        height: 30.h,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 1.w),
                                borderRadius:
                                BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "add to cart",
                                style: CustomTextStyles
                                    .hankenW600S14Primary,
                              ),
                              Icon(
                                Icons.add_shopping_cart,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}