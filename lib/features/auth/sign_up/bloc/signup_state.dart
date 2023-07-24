import 'package:built_value/built_value.dart';
import 'package:flight_app/features/auth/sign_up/data/model/signup_model.dart';


part 'signup_state.g.dart';

abstract class SignupState implements Built<SignupState,SignupStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  SignupModel? get signupModel;
  bool? get otpSuccess;
  bool? get otpError;


  SignupState._();

  factory SignupState([void Function(SignupStateBuilder) updates]) = _$SignupState;
  //flutter packages pub run build_runner build --delete-conflicting-outputs

  factory SignupState.initial() {
    return SignupState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..otpSuccess = false
      ..otpError = false
      ..error = ''
      ..signupModel = SignupModel()


    );
  }
}