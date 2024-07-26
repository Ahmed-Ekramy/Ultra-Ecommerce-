import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/images.dart';
import 'package:ultra/core/theming/string.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/routing.dart';
import '../../manager/home_cubit.dart';
import '../../widgets/custom_banner.dart';
import '../../widgets/custom_category.dart';
import '../../widgets/custom_clothes_list.dart';
import '../../widgets/custom_list_make_up.dart';
import '../../widgets/custom_types_of_clothing.dart';
import '../../widgets/cutom_top_categories.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0.h, right: 10.w, left: 10.w),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Row(
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
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50.h,
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomBanner(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Shop our Best Deals",
                    style: CustomTextStyles.hankenW600S14Primary
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.viewAllProduct);
                },
                child: Row(
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
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomDealProduct(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        const SliverFillRemaining(
          child: CustomCategory(),
        ),
      ]),
    );
  }
}
