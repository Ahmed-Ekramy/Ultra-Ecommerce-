import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import 'custom_category_shimmer.dart';
import 'custom_item_category.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(

      builder: (context, state) {
       if (state is GetCategoriesErrorState) {
          return Text(state.errorMessage);
        }
       else if (state is GetCategoriesSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.categoryModel.length,
            itemBuilder: (context, index) {
              return CustomItemCategory(index, state.categoryModel[index]);
            },
          );
        }
       return const CustomShimmerCategory();

      },
    );
  }
}
