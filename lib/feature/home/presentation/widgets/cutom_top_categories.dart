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

class CustomDealProduct extends StatelessWidget {
  const CustomDealProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(

      builder: (context, state) {
        if (state is GetProductsLoadingState) {
          return const CustomShimmerProduct();
        }
        else if (state is GetCategoriesSuccessState ||state is ChangeNavState) {
          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeCubit.get(context). productModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductDetailsView(
                              productModel: HomeCubit.get(context). productModel[index],
                            )));
                  },
                  child: CustomProduct(
                    HomeCubit.get(context). productModel[index],
                  ),
                );
              },
            ),
          );
        }
        else if (state is GetProductsErrorState) {
          return CustomErrorProduct(
            state.errorMessage,
          );
        }

            return const SizedBox();
          },
    );
  }
}
