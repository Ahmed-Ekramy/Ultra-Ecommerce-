import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';
import '../../../../core/widget/custom_shimmer_product.dart';

class CudtomShimmerProductDetail extends StatelessWidget {
  const CudtomShimmerProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            disableGesture: true,
            options: CarouselOptions(
              disableCenter: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlay: false,
              autoPlayCurve: Curves.ease,
            ),
            items: List.generate(3, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: Colors.grey[300], // Background for shimmer effect
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                        "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/",
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor:  Colors.grey.shade300,
                          highlightColor:  Colors.grey.shade100,
                          child: Container(
                            color: Colors.grey[300],
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor:Colors.grey.shade100,
            child: Text(
              "", // Handle potential null value
              style: CustomTextStyles.hankenW600S18Black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Text(
              "", // Combine highlights
              style: CustomTextStyles.hankenW500S14Black.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Text(
              "Description",
              style: CustomTextStyles.hankenW600S18Black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ReadMoreText(
              // No need to modify ReadMoreText as it likely handles loading states
              style: CustomTextStyles.hankenW400S12Black.copyWith(fontSize: 14.sp),
              "  Description,",
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
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(

                  color: Colors.grey.shade300,
                ),
              ),
              Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Text(
                      "Total Price: ",
                      style: CustomTextStyles.hankenW400S14GrayDark,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor:Colors.grey.shade100,
                    child: Text(
                      "",
                      style: CustomTextStyles.hankenW600S18Black,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(

            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Text(
              "Related Products",
              style: CustomTextStyles.hankenW600S18Black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomShimmerProduct(),
          // ... rest of your product details UI with shimmer effects as needed
          // (use Shimmer.fromColors for other elements that need loading animation)
        ],
      ),
    );
  }
}