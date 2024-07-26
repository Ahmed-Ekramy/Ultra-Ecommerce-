
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/network_error.dart';
import '../models/login_model.dart';
import '../models/login_request_body.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<Either<Failures, LoginModel>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      var response = await apiService.login(loginRequestBody);
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
