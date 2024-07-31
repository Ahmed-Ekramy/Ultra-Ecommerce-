import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/widget/custom_elevated_button.dart';
import 'package:ultra/core/widget/custom_text_form_field.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';
import '../manager/cart_cubit.dart';

class CustomSuccessCart extends StatelessWidget {
  const CustomSuccessCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Cart",
              style: CustomTextStyles.hankenW700S16Black,
            ),
            centerTitle: true,
          ),
          SliverList.builder(
              itemCount: CartCubit.get(context).cartList?.products.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0.w, vertical: 10.0.h),
                  margin: EdgeInsets.symmetric(vertical: 10.0.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.lightBlueColor),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://ltfpjeeclvrtomahvqyd.supabase.co/storage/v1/object/public/${CartCubit.get(context).cartList?.products[index].imageurl ?? ""}",
                        fit: BoxFit.fill,
                        height: 115.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              CartCubit.get(context)
                                      .cartList
                                      ?.products[index]
                                      .name ??
                                  "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.hankenW700S16Black,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "EGP",
                                  style: CustomTextStyles.hankenW400S14GrayDark,
                                ),
                                TextSpan(
                                    text:
                                        "  ${CartCubit.get(context).cartList?.products[index].price ?? 0}",
                                    style: CustomTextStyles.hankenW700S16Black)
                              ]),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: CartCubit.get(context)
                                                .cartList
                                                ?.products[index]
                                                .discount
                                                .toString() ??
                                            "0",
                                        style: CustomTextStyles
                                            .hankenW700S16Black),
                                    TextSpan(
                                      text: "%",
                                      style: CustomTextStyles
                                          .hankenW400S14GrayDark,
                                    )
                                  ]),
                                ),
                                Container(
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              int counter = 0;
                                              // product.count ?? 0;
                                              counter--;
                                              // GetCartCubit.get(context).upDate(
                                              //     product.product?.id ?? "", counter);
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              size: 20,
                                              color: Colors.white,
                                            )),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          0.toString(),
                                          // product.count.toString() ?? "0",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              // int counter = product.count ?? 0;
                                              // counter++;
                                              // GetCartCubit.get(context).upDate(
                                              //     product.product?.id ?? "", counter);
                                            },
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                              size: 20,
                                              color: Colors.white,
                                            ))
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 30.h,
          )),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Summary",
                      style: CustomTextStyles.hankenW700S16Black),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total withOut discount",
                          style: CustomTextStyles.hankenW400S14GrayDark),
                      Text(
                          "EGP ${CartCubit.get(context).cartList?.totalamountWithOutDiscount ?? 0}",
                          style: CustomTextStyles.hankenW700S16Black),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    borderColor: Colors.transparent,
                    hintText: "Promo code",
                    prefixIcon: Icons.local_offer_outlined,
                    prefixIconColor: AppColors.primaryColor,
                    suffixIcon: CustomElevationButton(
                      width: 120.w,
                      buttonName: "Apply",
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: CustomTextStyles.hankenW600S16White,
                      ),
                    ),
                    suffixIconColor: AppColors.primaryColor,
                    // onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("discount",
                          style: CustomTextStyles.hankenW400S14GrayDark),
                      Text(
                          "EGP ${CartCubit.get(context).cartList?.discount ?? 0}",
                          style: CustomTextStyles.hankenW700S16Black),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: CustomTextStyles.hankenW400S14GrayDark),
                      Text(
                          "EGP ${CartCubit.get(context).cartList?.totalamount ?? 0}",
                          style: CustomTextStyles.hankenW700S16Black),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomElevationButton(
                    buttonName: "Checkout",
                    onPressed: () {
                      // Navigator.pushNamed(context, "/checkout");
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
