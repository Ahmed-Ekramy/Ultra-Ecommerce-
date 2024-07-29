import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ultra/core/network/api_service.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';

import '../../../../core/network/network_error.dart';


class ProductDetailRepoImp {
  ApiService apiService;
  ProductDetailRepoImp( this.apiService);
  Future<Either<Failures,ProductDetailModel>> getProductDetails( int id) async {
    try {
      var response = await apiService.getProductsDetail(id);
      return Right(response);
    } catch (e) {
     if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}