import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ultra/core/widget/custom_shimmer_product.dart';
import 'package:ultra/feature/home/data/models/product_model.dart';
import 'package:ultra/feature/home/presentation/manager/home_cubit.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/theming/colors.dart';

import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_error_product.dart';
import '../manager/home_state.dart';

class CustomTopCategories extends StatelessWidget {
  const CustomTopCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, ResultState<List<ProductModel>>>(
      builder: (context, ResultState<List<ProductModel>> state) {
        return state.when(
          idle: () {
            return const CircularProgressIndicator();
          },
          loading: () {
            return const CustomShimmerProduct();
          },
          success: (List<ProductModel> productModel) {
            return SizedBox(
              height: 325.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Container(
                      width: 200.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.lightGreyColor, width: 1.w),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                height: 100.h,
                                width: 100.h,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "   https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/product/image_4.png",
                                // "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${productModel[index].productImage?[0].imageurl}",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            color: AppColors.primaryColor,
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(productModel[index].name ?? "",
                                style: CustomTextStyles.hankenW700S16Black),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${productModel[index].discount} %",
                                  style: CustomTextStyles.hankenW400S14GrayDark
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "${productModel[index].price} EGP",
                                  style: CustomTextStyles.hankenW700S12LightGray
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor:
                                              AppColors.darkGreyColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "${productModel[index].discountedPrice} EGP",
                              style: CustomTextStyles.hankenW600S18Black
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                              child: SizedBox(
                                width: 150.w,
                                height: 30.h,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "add to cart",
                                        style: CustomTextStyles
                                            .hankenW600S14Primary,
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart,
                                        color: AppColors.primaryColor,
                                        size: 20.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (NetworkExceptions error) {
            return CustomErrorProduct(NetworkExceptions.getDioException(error));
          },
          changeGridViewListViewState: () {
            return const CircularProgressIndicator();
          },
          changeNavState: () {
            return const CircularProgressIndicator();
          },
          changeSelectedIndexBrandState: () {
            return const CircularProgressIndicator();
          },
          changeSelectedIndexBrandMakeUpState: () {
            return const CircularProgressIndicator();
          },
          changeSelectedIndexTypeOfClothesState: () {
            return const CircularProgressIndicator();
          },
          searchIndexByNameState: () {
            return const CircularProgressIndicator();
          },
        );
        return const SizedBox();
      },
    );
  }
}
