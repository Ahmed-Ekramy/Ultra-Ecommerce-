import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/widget/custom_elevated_button.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/theming/string.dart';
import '../../../home/data/models/product_model.dart';
import '../manager/product_details_cubit.dart';
import '../manager/product_details_state.dart';
import '../widgets/custom_clothes_list.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    this.productModel,
  });
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailsCubit>()
        ..getProductDetails(productModel?.productId ?? 0),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.blueColor),
            ),
            actions: [
              Icon(
                Icons.favorite_border,
                size: 25.sp,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(
                FontAwesomeIcons.cartShopping,
                size: 25.sp,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          body: SingleChildScrollView(child: BlocBuilder<ProductDetailsCubit,
              ProductDetailsState<ProductDetailModel>>(
            builder: (context, state) {
              return state.when(loading: () {
                return const Center(child: CircularProgressIndicator());
              }, success: (ProductDetailModel productDetailsModel) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        disableGesture: true,
                        options: CarouselOptions(
                            disableCenter: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            autoPlay: false,
                            autoPlayCurve: Curves.ease),
                        items: productDetailsModel.productImage
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl:
                                          "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${e.imageurl}",
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        productDetailsModel.name,
                        style: CustomTextStyles.hankenW600S18Black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          "${productDetailsModel.highlights[0]}\n ${productDetailsModel.highlights[1]}\n ${productDetailsModel.highlights[2]}",
                          style: CustomTextStyles.hankenW500S14Black
                              .copyWith(color: Colors.grey)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Description",
                        style: CustomTextStyles.hankenW600S18Black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ReadMoreText(
                        style: CustomTextStyles.hankenW400S12Black
                            .copyWith(fontSize: 14.sp),
                        productDetailsModel.description,
                        trimMode: TrimMode.Line,
                        trimLines: 4,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: ' ..Read more',
                        trimExpandedText: ' ..Read less',
                        moreStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                        lessStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevationButton(
                            buttonName: "Buy Now",
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                          Column(
                            children: [
                              Text(
                                "Total Price: ",
                                style: CustomTextStyles.hankenW400S14GrayDark,
                              ),
                              Text(
                                "\$ ${productDetailsModel.price}",
                                style: CustomTextStyles.hankenW600S18Black,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Related Products",
                        style: CustomTextStyles.hankenW600S18Black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomRelatedList(),
                    ],
                  ),
                );
              }, error: (NetworkExceptions networkExceptions) {
                return const Center(child: CircularProgressIndicator());
              });
            },
          ))),
    );
  }
}
