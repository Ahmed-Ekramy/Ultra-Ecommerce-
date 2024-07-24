
import 'package:ultra/core/network/api_result.dart';
import 'package:ultra/core/network/api_service.dart';
import 'package:ultra/core/network/network_exceptions.dart';
import 'package:ultra/feature/home/data/models/catogries_model.dart';
import '../models/product_model.dart';

class HomeRepoImp {
  final ApiService apiService;
  HomeRepoImp(this.apiService);
  Future<ApiResult < List<ProductModel>>> getProducts() async {
   try {
      var response = await apiService.getProducts();
      return ApiResult.success(response);
    }catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
  Future<ApiResult <CategoryModel>> getCategories() async {
    try {
      var response = await apiService.getCategories();
      return ApiResult.success(response);
    }catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}


