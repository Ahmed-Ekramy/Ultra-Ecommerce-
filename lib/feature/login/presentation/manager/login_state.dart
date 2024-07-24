import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/network/network_exceptions.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState <T>{
  const factory LoginState.loading() = Loading<T>;
  const factory LoginState.error( NetworkExceptions error) = Error<T>;
  const factory LoginState.success( T data) = Success<T>;
  const factory LoginState.obscureChangeState( T data) = ObscureChangeState<T>;
}
