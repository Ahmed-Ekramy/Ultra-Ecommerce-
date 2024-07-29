import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/feature/categories_item_by_id/presentation/manager/Categories_by_id_state.dart';
import 'package:ultra/feature/categories_item_by_id/presentation/manager/category_by_id_cubit.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({this.index, this.id, super.key});

  final int? index;
  final int? id;

  @override
  Widget build(BuildContext context) {
    log(index.toString());
    log(id.toString());
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<CategoryByIdCubit>()
          ..getBannerCategoriesById()
          ..getProductCategoriesById(id!)
          ..getBrandCategoriesById(id!),
        child: BlocBuilder<CategoryByIdCubit, CategoriesByIdState>(
          builder: (context, state) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   backgroundColor: Colors.white,
                  //   expandedHeight: 250.h,
                  //   flexibleSpace: FlexibleSpaceBar(
                  //     background: Image.network(
                  //       "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${CategoryByIdCubit.get(context).banners[index!].imageUrl}",
                  //       height: 60.h,
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          //itemCount: CategoryByIdCubit.get(context).brands.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30.w,
                                    // backgroundColor: HomeCubit
                                    //     .get(context)
                                    //     .selectedIndexBrandShoes == index
                                    //     ? AppColors.primaryColor
                                    //     :
                                    backgroundColor: AppColors.lightGreyColor,
                                    child: Image.asset(
                                      AppImages.adidas,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text("adidas",
                                      style:
                                          CustomTextStyles.hankenW700S12Black),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  SliverGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 4 / 6,
                      children: List.generate(
                          CategoryByIdCubit.get(context).products.length,
                          (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
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
                                    child: Image.network(
                                      "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${CategoryByIdCubit.get(context).products[index].imageUrl}",
                                      width: 120,
                                      height: 115.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                      CategoryByIdCubit.get(context)
                                          .products[index]
                                          .name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          CustomTextStyles.hankenW700S16Black),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Men’s Shoes",
                                    style: CustomTextStyles
                                        .hankenW400S14GrayDark
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "700000 EGP",
                                    style: CustomTextStyles
                                        .hankenW700S12LightGray
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                AppColors.darkGreyColor),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "500000 EGP",
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
                      }))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
