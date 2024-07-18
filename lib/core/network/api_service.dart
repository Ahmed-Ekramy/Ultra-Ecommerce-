
import 'package:retrofit/http.dart';
import 'package:ultra/core/network/apis.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';
import '../../feature/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ConstantApis.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET(ConstantApis.getProducts)
  Future< List<ProductModel>> getProducts();
 @GET("${ConstantApis.getProducts}/{id}")
  Future< ProductDetailModel> getProductsDetail( @Path("id") num id);
}