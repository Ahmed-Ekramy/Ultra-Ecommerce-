import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ultra/core/network/api_service.dart';

import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/network/network_error.dart';
import '../models/cart_model.dart';

class CartRepo {
  ApiService apiService;

  CartRepo(this.apiService);

  Future<Either<Failures, CartModel>> getCart() async {
    var userId = CacheHelper.getData("UserId");
    var userToken = CacheHelper.getData("User");
    log(userToken);
    log(userId);
    try {
      var response = await apiService.getCart(
        "application/json",
        "Bearer $userToken",
        userId,
      );
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
}
