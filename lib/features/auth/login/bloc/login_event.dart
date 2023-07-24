part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUserEvent extends LoginEvent{
  final String email, password;

  LoginUserEvent({
    required this.email,
    required this.password
  });
}

class OtpSubmitEvent extends LoginEvent{
  final int otp;

  OtpSubmitEvent({
    required this.otp,
  });
}
