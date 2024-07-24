import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/network_exceptions.dart';
part 'sign_up_state.freezed.dart';
@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.loading() = Loading<T>;
  const factory SignUpState.error( NetworkExceptions error) = Error<T>;
  const factory SignUpState.success( T data) = Success<T>;
  const factory SignUpState.obscureChangeState( T data) = ObscureChangeState<T>;
}
