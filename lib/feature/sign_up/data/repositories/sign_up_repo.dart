import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ultra/core/network/api_service.dart';
import '../../../../core/network/network_error.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_request_body.dart';

 class SignUpRepo{
  final ApiService apiService;
  SignUpRepo(this.apiService);
  Future<Either<Failures, SignUpModel>> signup(SignUpRequestBody signUpRequestBody ) async {
    try {
      var response = await apiService.signup( signUpRequestBody  );
      return Right(response);
    } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDiorError(e));
        }
        return Left(ServerFailure(e.toString()));
      }
    }
  }
