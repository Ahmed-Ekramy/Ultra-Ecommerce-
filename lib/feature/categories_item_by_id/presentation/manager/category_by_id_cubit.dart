import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/categories_item_by_id/data/models/banner_category_model.dart';
import 'package:ultra/feature/categories_item_by_id/data/models/brand_category_model.dart';
import 'package:ultra/feature/categories_item_by_id/data/repositories/categories_item%20_by_id_repo.dart';
import 'package:ultra/feature/categories_item_by_id/presentation/manager/Categories_by_id_state.dart';

import '../../data/models/product_by_category_model.dart';

class CategoryByIdCubit extends Cubit<CategoriesByIdState> {
  CategoryByIdCubit(this.categoriesItemByIdRepo)
      : super(CategoriesByIdInitial());
  CategoriesItemByIdRepo categoriesItemByIdRepo;
  static CategoryByIdCubit get(context) => BlocProvider.of(context);
  List<ProductCategoryModel> products = [];
  List<BrandCategoryModel> brands = [];
  List<BannerCategoryModel> banners = [];

  void getProductCategoriesById(int id) async {
    emit(CategoriesByIdLoading());
    var result =
        await categoriesItemByIdRepo.getProductCategoriesItemByIdRepo(id);
    result.fold((l) {
      emit(ProductCategoriesByIdError(error: l.message));
    }, (r) {
      products = r;
      emit(ProductCategoriesByIdSuccess());
    });
  }

  void getBrandCategoriesById(int id) async {
    emit(CategoriesByIdLoading());
    var result =
        await categoriesItemByIdRepo.getBrandCategoriesItemByIdRepo(id);
    log( result.toString());
    result.fold((l) {
      emit(BannerCategoriesByIdError(error: l.message));
    }, (r) {
      log ("${r.toString()}vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      brands = r;
      emit(BrandCategoriesByIdSuccess());
    });
  }

  void getBannerCategoriesById() async {
    emit(CategoriesByIdLoading());
    var result =
        await categoriesItemByIdRepo.getBannerCategoriesItemByIdRepo(2);
    result.fold((l) {
      emit(BannerCategoriesByIdError(error: l.message));
    }, (r) {
      log (r[0].imageUrl.toString());
      banners = r;
      emit(BrandCategoriesByIdSuccess());
    });
  }
}
