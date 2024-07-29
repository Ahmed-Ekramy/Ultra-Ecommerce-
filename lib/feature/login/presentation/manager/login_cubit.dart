import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repositories/login_repo_imp.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginLoadingState());
  LoginRepo loginRepo;
  bool isObscured = true;

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changeLoginObscure() {
    isObscured = !isObscured;
    emit(LoginObscureChangeState( isObscured));
  }

  void login() async {
    emit(LoginLoadingState());
    var data = await loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));
    log(data.toString());
    log(emailController.text);
    log(passwordController.text);
    data.fold((l) {
      emit(LoginErrorState(l.message));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
