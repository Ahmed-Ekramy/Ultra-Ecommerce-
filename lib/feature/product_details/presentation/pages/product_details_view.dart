import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/widget/custom_elevated_button.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_error_product.dart';
import '../../../home/data/models/product_model.dart';
import '../manager/product_details_cubit.dart';
import '../manager/product_details_state.dart';
import '../widgets/custom_clothes_list.dart';
import '../widgets/custom_shimmer_product_details.dart';

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
        ..getProductDetails(productModel?.productid ?? 0),
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
          body: SingleChildScrollView(
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsFailureState) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 32,
                    ),
                    content: Text(
                      state.error.toString(),
                      style: CustomTextStyles.hankenW700S14Primary,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Got it',
                          style: CustomTextStyles.hankenW700S14Primary,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ProductDetailsSuccessState) {
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
                        items: ProductDetailsCubit.get(context)
                            .productDetailModel
                            ?.productImage
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
                        ProductDetailsCubit.get(context)
                            .productDetailModel!
                            .name,
                        style: CustomTextStyles.hankenW600S18Black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          "${ProductDetailsCubit.get(context).productDetailModel?.highlights[0]}\n ${ProductDetailsCubit.get(context).productDetailModel?.highlights[1]}\n ${ProductDetailsCubit.get(context).productDetailModel?.highlights[2]}",
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
                        ProductDetailsCubit.get(context)
                            .productDetailModel!
                            .description,
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
                                "\$ ${ProductDetailsCubit.get(context).productDetailModel?.price}",
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
              }
              return const CudtomShimmerProductDetail();
            },
          ))),
    );
  }
}
