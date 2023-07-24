import 'package:built_value/built_value.dart';

import '../data/model/login_model.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState,LoginStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  LoginModel? get loginModel;
  bool? get otpSuccess;
  bool? get otpError;


  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;
  //flutter packages pub run build_runner build --delete-conflicting-outputs

  factory LoginState.initial() {
    return LoginState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..otpSuccess = false
      ..otpError = false
      ..error = ''
      ..loginModel = LoginModel()


    );
  }
}