import 'package:equatable/equatable.dart';
import 'package:ultra/feature/login/data/models/login_model.dart';

 abstract class LoginState {
}
class LoginLoadingState extends  LoginState{
}
class LoginSuccessState extends  LoginState{
 final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends  LoginState{
final String error;
  LoginErrorState(this.error);

}
class LoginObscureChangeState extends  LoginState{
   final bool obscure;
  LoginObscureChangeState(this.obscure);
}