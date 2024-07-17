import 'package:dartz/dartz.dart';
import 'package:retrofit/http.dart';
import 'package:ultra/core/network/apis.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../feature/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ConstantApis.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ConstantApis.getProducts)
  Future< List<ProductModel>> getProducts();

}