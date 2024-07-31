import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ultra/core/network/network_error.dart';
import 'package:ultra/feature/categories_item_by_id/data/models/product_by_category_model.dart';

import '../../../../core/network/api_service.dart';
import '../models/banner_category_model.dart';
import '../models/brand_category_model.dart';

class CategoriesItemByIdRepo {
  ApiService apiService;

  CategoriesItemByIdRepo(this.apiService);

  Future<Either<Failures, List<ProductCategoryModel>>>
      getProductCategoriesItemByIdRepo(int id) async {
    try {
      var data = await apiService.getProductsByCategory(id);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<BrandCategoryModel>>>
      getBrandCategoriesItemByIdRepo(int id) async {
    try {
      var data = await apiService.getCategoriesBrands(id);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, BannerCategoryModel>>
      getBannerCategoriesItemByIdRepo(int id) async {
    try {
      var data = await apiService.getCategoriesBanner(id);
      log("${data}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
