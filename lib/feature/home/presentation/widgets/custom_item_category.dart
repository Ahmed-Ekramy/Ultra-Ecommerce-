import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../../data/models/catogries_model.dart';
import 'custom_list_make_up.dart';
import 'custom_make_up_prand.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory(this.index,  this.categoryModel,{super.key});
  final int index;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${categoryModel.parant.bannerImage}",
              height: 60.h,
              fit: BoxFit.fill,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(categoryModel.parant.name.toString(),
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
        CustomMakeUpBrand(categoryModel,index),
        SizedBox(
          height: 20.h,
        ),
         CustomListMakeUp(categoryModel, index),
      ],
    );
  }
}