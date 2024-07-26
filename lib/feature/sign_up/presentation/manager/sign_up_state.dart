import 'package:equatable/equatable.dart';

import '../../data/models/sign_up_model.dart';

abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoading <T>extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  final SignUpModel signUpModel;
  SignUpSuccess(this.signUpModel);
  @override
  List<Object> get props => [signUpModel];
}

class SignUpError extends SignUpState {
  final String error;
  SignUpError(this.error);
  @override
  List<Object> get props => [error];
}

class ObscureChangeState<T> extends SignUpState {
  final bool data;
  ObscureChangeState(this.data);
  @override
  List<Object> get props => [ data ];
}