
import 'package:ultra/core/network/api_result.dart';
import 'package:ultra/core/network/api_service.dart';
import 'package:ultra/core/network/network_exceptions.dart';
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
}


