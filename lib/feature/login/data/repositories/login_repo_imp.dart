import 'dart:developer';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/login_model.dart';
import '../models/login_request_body.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<LoginModel>> login(LoginRequestBody loginRequestBody) async{
    try {
      var response =await apiService.login(loginRequestBody);
      log(loginRequestBody.email.toString());
      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
