import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra/feature/sign_up/data/models/sign_up_request_body.dart';
import 'package:ultra/feature/sign_up/data/repositories/sign_up_repo.dart';
import 'package:ultra/feature/sign_up/presentation/manager/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super( SignUpLoading());
  SignUpRepo signUpRepo;
  bool isObscured = true;
  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changeObscure() {
    isObscured = !isObscured;
    emit(ObscureChangeState(isObscured));
  }

  void signUp() async {
    emit( SignUpLoading());
    var data = await signUpRepo.signup(SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        fullName: fullNameController.text,
        phone: phoneController.text));
    data.fold((l) {
      emit(SignUpError(l.message));
    },
        (r) {
          emit(SignUpSuccess(r));
        });
  }
}
