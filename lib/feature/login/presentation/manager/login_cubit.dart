import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../data/models/login_model.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repositories/login_repo_imp.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState<dynamic>> {
  LoginCubit(this.loginRepo) : super(const Loading());
  LoginRepo loginRepo;
  bool isObscured = true;
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void changeObscure() {
    isObscured = !isObscured;
    emit( LoginState.obscureChangeState(isObscured));
  }
  void login() async {
    emit(const LoginState.loading());
    var data = await loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));
    log(data.toString());
    log(emailController.text);
    log(passwordController.text);
    data.when(success: (LoginModel loginModel) {
      emit(LoginState.success(loginModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(LoginState.error(networkExceptions));
    });
  }
}
