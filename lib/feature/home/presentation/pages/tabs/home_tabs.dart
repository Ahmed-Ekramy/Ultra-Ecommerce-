import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/images.dart';
import 'package:ultra/core/theming/string.dart';
import 'package:ultra/feature/home/data/models/product_model.dart';
import '../../manager/home_cubit.dart';
import '../../widgets/custom_banner.dart';
import '../../widgets/custom_clothes_list.dart';
import '../../widgets/custom_list_make_up.dart';
import '../../widgets/custom_make_up_prand.dart';
import '../../widgets/custom_popular_brand.dart';
import '../../widgets/custom_shoes_prand.dart';
import '../../widgets/custom_types_of_clothing.dart';
import '../../widgets/cutom_top_categories.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0.h, right: 10.w, left: 10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.cartPlus,
                  color: AppColors.darkGreyColor,
                  size: 24.sp,
                ),
                Row(
                  children: [
                    Text(
                      "Welcome",
                      style: CustomTextStyles.hankenW400S16Black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Ahmed Ekramy",
                      style: CustomTextStyles.hankenW700S16Black
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(
                  FontAwesomeIcons.bell,
                  color: AppColors.darkGreyColor,
                  size: 24.sp,
                ),
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            const CustomBanner(),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Shop our top ",
                      style: CustomTextStyles.hankenW400S16Black.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                    Text("Categories",
                        style: CustomTextStyles.hankenW700S14Primary.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18.sp)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: CustomTextStyles.hankenW600S12Black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              AppImages.phone,
                              height: 80.h,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Shop our top  Categories",
                      style: CustomTextStyles.hankenW600S14Primary.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: CustomTextStyles.hankenW600S12Black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTopCategories(
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Brand",
                    style: CustomTextStyles.hankenW700S12Black
                        .copyWith(fontSize: 18.sp)),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: CustomTextStyles.hankenW600S12Black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomPopularBrand(),
            SizedBox(
              height: 20.h,
            ),
            const CustomListShoesBrand(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Beauty",
                    style: CustomTextStyles.hankenW700S12Black
                        .copyWith(fontSize: 18.sp)),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: CustomTextStyles.hankenW600S12Black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Image.asset(
                  AppImages.makeupBackground,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 5.h,
                  left: 20.w,
                  child: Column(
                    children: [
                      Text(
                        "Beauty and skin care",
                        style: CustomTextStyles.hankenW500S14Black,
                      ),
                      Text(
                        "UP to 50% OFF",
                        style: CustomTextStyles.hankenW500S14White,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5.h,
                  left: 300.w,
                  child: Image.asset(
                    height: 50.h,
                    AppImages.shampoo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomMakeUpBrand(),
            SizedBox(
              height: 20.h,
            ),
            const CustomListMakeUp(),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Image.asset(
                  AppImages.nike,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 5.h,
                  left: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buy the best clothes from the\n most famous brands",
                        style: CustomTextStyles.hankenW500S14White,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "UP to 50% OFF",
                        style: CustomTextStyles.hankenW500S14White,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTypeOfClothes(),
            SizedBox(
              height: 20.h,
            ),
            const CustomListClothes(),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Image.asset(
                  AppImages.cashBack,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 5.h,
                  left: 20.w,
                  child: Column(
                    children: [
                      Text(
                        "Get 5% cash back",
                        style: CustomTextStyles.hankenW500S14Black,
                      ),
                      Text(
                        "on Ultra market",
                        style: CustomTextStyles.hankenW700S12Black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: -5.w,
                  child: Image.asset(
                    height: 50.h,
                    AppImages.card,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomListClothes(),
          ],
        ),
      ),
    );
  }
}
