import 'package:ultra/core/network/api_service.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_request_body.dart';

 class SignUpRepo{
  final ApiService apiService;
  SignUpRepo(this.apiService);
  Future<ApiResult<SignUpModel>> signup(SignUpRequestBody signUpRequestBody ) async {
    try {
      var response = await apiService.signup( signUpRequestBody  );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}