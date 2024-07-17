import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/feature/home/presentation/manager/home_state.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../manager/home_cubit.dart';

class CustomMakeUpBrand extends StatelessWidget {
  const CustomMakeUpBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: BlocBuilder<HomeCubit, ResultState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
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
                        backgroundColor: HomeCubit
                            .get(context)
                            .selectedIndexBrandMakeUp == index
                            ? AppColors.pinkColor
                            : AppColors.lightGreyColor,
                        child: Image.asset(
                          AppImages.makeup,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("makeup",
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