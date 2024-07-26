import 'package:ultra/core/network/api_service.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/network_exceptions.dart';

class ProductDetailRepoImp {
  ApiService apiService;
  ProductDetailRepoImp( this.apiService);
  Future<ApiResult <ProductDetailModel>> getProductDetails( num id) async {
    try {
      var response = await apiService.getProductsDetail(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(  ErrorHandler.handle(e));
    }
  }
}