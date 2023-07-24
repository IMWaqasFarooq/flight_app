part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class RegisterUserEvent extends SignupEvent{
  final String email, password,name,number;

  RegisterUserEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.number,
  });
}

class OtpSubmitEvent extends SignupEvent{
  final int otp;

  OtpSubmitEvent({
    required this.otp,
  });
}