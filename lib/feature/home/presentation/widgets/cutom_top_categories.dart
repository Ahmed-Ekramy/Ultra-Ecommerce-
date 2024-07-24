import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/widget/custom_shimmer_product.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';
import 'package:ultra/feature/home/presentation/widgets/custom_product_view.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/widget/custom_error_product.dart';
import '../../../product_details/presentation/pages/product_details_view.dart';
import '../manager/home_state.dart';

class CustomTopCategories extends StatelessWidget {
  const CustomTopCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, ResultState<dynamic>>(
      buildWhen: (previous, current) =>
      current is Loading ||
          current is Success ||
          current is Error,
      builder: (context, ResultState<dynamic> state) {
        return state.maybeWhen(
          loading: () {
            return const CustomShimmerProduct();
          },
          success: (dynamic productModel) {
            return SizedBox(
              height: 325.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productModel.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailsView(
                                    productModel: productModel[index],
                                  )));
                    },
                    child: CustomProduct(
                      productModel[index],
                    ),
                  );
                },
              ),
            );
          },
          error: (NetworkExceptions error) {
            return CustomErrorProduct(
                NetworkExceptions.getDioException(error));
          },
          orElse: () {
            return const SizedBox();
          },
        );
        return const SizedBox();
      },
    );
  }
}
