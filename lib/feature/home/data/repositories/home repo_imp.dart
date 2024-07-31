import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ultra/core/network/api_service.dart';
import 'package:ultra/feature/cart/data/models/cart_item_model.dart';
import 'package:ultra/feature/home/data/models/catogries_model.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/network/network_error.dart';
import '../models/product_model.dart';

class HomeRepoImp {
  final ApiService apiService;

  HomeRepoImp(this.apiService);

  Future<Either<Failures, List<ProductModel>>> getProducts() async {
    try {
      var response = await apiService.getProducts();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        return Left(ServerFailure.fromDiorError(e));
      }
      print(ServerFailure(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<CategoryModel>>> getCategories() async {
    try {
      var response = await apiService.getCategories();
      log("${response[0].products[0].name}ffffffffffffffffffffffff");
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        return Left(ServerFailure.fromDiorError(e));
      }
      print(ServerFailure(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  // Future<Either<Failures, List<CategoryModel>>> addCart( int id,
  //     CartItemModel cartItemModel) async {
  //   var userToken = CacheHelper.getData("User");
  //   try {
  //     var response = await apiService.addItemToCart(
  //         "$id",
  //         "Bearer $userToken",
  //         "application/json", cartItemModel);
  //    // log("${response[0].products[0].name}ffffffffffffffffffffffff");
  //     return Right(response);
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e.response);
  //       return Left(ServerFailure.fromDiorError(e));
  //     }
  //     print(ServerFailure(e.toString()));
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }
}
