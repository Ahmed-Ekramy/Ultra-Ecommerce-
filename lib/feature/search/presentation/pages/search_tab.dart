import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra/core/widget/custom_text_form_field.dart';
import 'package:ultra/feature/search/presentation/manager/search_cubit.dart';
import 'package:ultra/feature/search/presentation/manager/search_state.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/string.dart';
import '../../../home/data/models/product_model.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../home/presentation/manager/home_state.dart';
import '../widgets/custom_gridview_search.dart';
import '../widgets/custom_list_search.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SearchCubit(),
  child: BlocBuilder<SearchCubit, SearchState<dynamic>>(
      buildWhen: (previous, current) =>
          current is ChangeGridViewListViewState ||
          current is SearchIndexByNameState,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20.0.w, right: 10.w, left: 10.w),
          child: CustomScrollView(
            dragStartBehavior: DragStartBehavior.down,
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
                    IconButton(
                      icon: Icon(
                        SearchCubit.get(context).isGridView
                            ? Icons.grid_view_rounded
                            : Icons.list_rounded,
                        size: 35.sp,
                      ),
                      onPressed: () {
                        SearchCubit.get(context).changeGridViewListView();
                      },
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
                          SearchCubit.get(context).searchByName(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                SearchCubit.get(context).searchIndexByName ==
                                            index
                                        ? AppColors.primaryColor
                                        : AppColors.lightGreyColor,
                                borderRadius: BorderRadius.circular(20.r)),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Center(
                              child: Text(
                                "Jordan",
                                style: SearchCubit.get(context)
                                            .searchIndexByName ==
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
              SearchCubit.get(context).isGridView
                  ? SliverFixedExtentList(
                      itemExtent: 115.h,
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const CustomListViewSearch(
                          name: "Nike Free Terr Vista Next Nature",
                          label: "Men’s Shoes",
                          price: "\$120.00",
                        ),
                        childCount: 10,
                      ),
                    )
                  : SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0.w,
                        mainAxisSpacing: 10.0.h,
                        childAspectRatio: 0.71,
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
    ),
);
  }
}
