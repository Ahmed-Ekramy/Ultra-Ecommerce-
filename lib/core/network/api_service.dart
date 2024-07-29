
import 'package:dartz/dartz.dart';
import 'package:retrofit/http.dart';
import 'package:ultra/core/network/apis.dart';
import 'package:ultra/feature/login/data/models/login_request_body.dart';
import 'package:ultra/feature/product_details/data/models/product_details_model.dart';
import 'package:ultra/feature/sign_up/data/models/sign_up_model.dart';
import 'package:ultra/feature/sign_up/data/models/sign_up_request_body.dart';
import '../../feature/categories_item_by_id/data/models/banner_category_model.dart';
import '../../feature/categories_item_by_id/data/models/brand_category_model.dart';
import '../../feature/categories_item_by_id/data/models/product_by_category_model.dart';
import '../../feature/home/data/models/catogries_model.dart';
import '../../feature/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../feature/login/data/models/login_model.dart';
import 'network_error.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ConstantApis.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ConstantApis.login)
  Future< LoginModel> login(@Body() LoginRequestBody loginRequestBody);
@POST(ConstantApis.signup)
  Future<SignUpModel> signup(@Body() SignUpRequestBody signUpRequestBody);
  @GET(ConstantApis.getProducts)
  Future< List<ProductModel>> getProducts();
 @GET("${ConstantApis.getProductsDetail}/{id}")
  Future< ProductDetailModel> getProductsDetail( @Path("id") int id);
 @GET(ConstantApis.getCategories)
  Future< List<CategoryModel>> getCategories();
 @GET("${ConstantApis.getCategories}/{id}")
  Future< List<ProductCategoryModel>> getProductsByCategory( @Path("id") int id);
 @GET("${ConstantApis.getCategoriesBrands}/{id}")
  Future< List<BrandCategoryModel>> getCategoriesBrands( @Path("id")  int id);
 @GET("${ConstantApis.getCategoriesBanner}/{id}")
  Future< List<BannerCategoryModel>> getCategoriesBanner(@Path("id")  int id);

}