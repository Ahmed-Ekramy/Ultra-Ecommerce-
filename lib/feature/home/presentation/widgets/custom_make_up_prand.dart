import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/feature/home/presentation/manager/home_state.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../../data/models/catogries_model.dart';
import '../manager/home_cubit.dart';

class CustomMakeUpBrand extends StatelessWidget {
  CustomMakeUpBrand(
    this.categoryModel,
    this.index, {
    super.key,
  });

  CategoryModel categoryModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: BlocBuilder<HomeCubit, ResultState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryModel.categories[index].children.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  HomeCubit.get(context).changeSelectedBrandMakeUp(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30.w,
                        backgroundColor:
                            HomeCubit.get(context).selectedIndexBrandMakeUp ==
                                    index
                                ? AppColors.primaryColor
                                : AppColors.lightGreyColor,
                        child: Image.network(
                          "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${categoryModel.categories[index].products[index].imageUrl}",
                          height: 60.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          categoryModel.categories[index].children[index].name
                              .toString(),
                          style: CustomTextStyles.hankenW700S12Black),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
