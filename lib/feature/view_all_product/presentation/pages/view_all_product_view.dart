import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/widget/custom_error_product.dart';
import '../../../../core/widget/custom_shimmer_product.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../home/presentation/manager/home_state.dart';
import '../../../home/presentation/widgets/custom_product_view.dart';
import '../../../product_details/presentation/pages/product_details_view.dart';

class ViewAllProductView extends StatelessWidget {
  const ViewAllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        getIt<HomeCubit>()
          ..getProducts(),
        child: BlocBuilder<HomeCubit, ResultState<dynamic>>(
          builder: (context, state) {
            return SafeArea(child: Scaffold(
                body:
                state.maybeWhen(
                    idle: () {
                      return const CircularProgressIndicator();
                    },
                    loading: () {
                      return const CustomShimmerProduct();
                    },
                    success: (dynamic productModel) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.h),
                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 4 / 7,
                            children: List.generate(
                                productModel.length,
                                    (index) {
                                  return
                                    InkWell(
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
                                }

                            )
                        ),
                      );
                    },
                    error: (NetworkExceptions error) {
                      return CustomErrorProduct(error);
                    },

                    orElse: () {
                      return null;
                    }
                )));
          },
        )
    );
  }
}

