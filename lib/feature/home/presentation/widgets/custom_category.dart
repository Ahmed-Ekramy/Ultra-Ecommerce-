import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';
import 'custom_item_category.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, ResultState<dynamic>>(
      buildWhen: (previous, current) =>
      current is CatogriesSuccess ||
          current is CategoryLoading ||
          current is CategoryError,
      builder: (context, state) {
        return state.maybeWhen(
            categoryLoading: () {
          return const CircularProgressIndicator();
        }, categoriesSuccess: (categoryModel) {
          return SizedBox(
            height: 300.h,
            child: ListView.builder(
                itemCount: categoryModel.categories.length,
                itemBuilder: (context, index) {
                  return CustomItemCategory(index, categoryModel);
                }),
          );
        }, categoryError: (networkExceptions) {
          return Text(networkExceptions.toString());
        }, orElse: () {
          return SizedBox(
            height: 200.h,
          );
        });
      },
    );
  }
}
