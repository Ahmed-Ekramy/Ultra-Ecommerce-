import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/widget/custom_text_form_field.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/string.dart';
import '../../manager/home_cubit.dart';
import '../../widgets/custom_gridview_search.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20.0.w, right: 10.w, left: 10.w),
          child: CustomScrollView(
            dragStartBehavior: DragStartBehavior.down ,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300.w,
                      height: 45.h,
                      child: CustomTextFormField(
                        borderColor: Colors.transparent,
                        hintText: "Search by name, brand...",
                        borderRadius: 20.r,
                        prefixIcon: Icons.search,
                        prefixIconColor: AppColors.darkGreyColor,
                      ),
                    ),
                    Icon(
                      Icons.grid_view_rounded,
                      size: 25.sp,
                    ),
                    Icon(
                      Icons.list,
                      size: 25.sp,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          HomeCubit.get(context).searchByName(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: HomeCubit.get(context).searchIndexByName ==
                                        index
                                    ? AppColors.primaryColor
                                    : AppColors.lightGreyColor,
                                borderRadius: BorderRadius.circular(20.r)),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Center(
                              child: Text(
                                "Jordan",
                                style: HomeCubit.get(context).searchIndexByName ==
                                        index
                                    ? CustomTextStyles.hankenW700S12LightGray
                                    : CustomTextStyles.hankenW400S14GrayDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                                ),
                ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0.w,
                  mainAxisSpacing: 10.0.h,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CustomGridViewSearch(),
                  childCount: 10,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
