import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';
import '../../data/models/product_model.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct(this.productModel, {
    super.key,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.lightGreyColor,
            width: 1.w),
        borderRadius: BorderRadius.circular(
            5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start,
        children: [
          Center(
            child: CachedNetworkImage(
              height: 150.h,
              width: 100.h,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              imageUrl:
              "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${productModel
                  .productImage[0].imageurl}",
              progressIndicatorBuilder:
                  (context, url,
                  downloadProgress) =>
                  CircularProgressIndicator(
                      color: AppColors
                          .primaryColor,
                      value: downloadProgress
                          .progress),
              errorWidget: (context, url,
                  error) =>
              const Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(productModel.name ?? "",
              style: CustomTextStyles
                  .hankenW700S16Black),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                "${productModel
                    .discount} %",
                style: CustomTextStyles
                    .hankenW400S14GrayDark
                    .copyWith(
                    fontWeight: FontWeight
                        .bold),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "${productModel
                    .price} EGP",
                style: CustomTextStyles
                    .hankenW700S12LightGray
                    .copyWith(
                    fontWeight: FontWeight
                        .bold,
                    decoration:
                    TextDecoration
                        .lineThrough,
                    decorationColor:
                    AppColors.darkGreyColor),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "${productModel
                .discountedPrice} EGP",
            style: CustomTextStyles
                .hankenW600S18Black
                .copyWith(
                fontWeight: FontWeight.bold),
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
                  shape: MaterialStateProperty
                      .all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors
                              .primaryColor,
                          width: 1.w),
                      borderRadius:
                      BorderRadius.circular(
                          20.r),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text(
                      "add to cart",
                      style: CustomTextStyles
                          .hankenW600S14Primary,
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      color: AppColors
                          .primaryColor,
                      size: 20.sp,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}