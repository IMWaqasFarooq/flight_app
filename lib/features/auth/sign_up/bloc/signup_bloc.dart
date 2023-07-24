import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flight_app/features/auth/sign_up/bloc/signup_state.dart';
import 'package:flight_app/features/auth/sign_up/data/model/signup_model.dart';
import 'package:meta/meta.dart';

import '../data/data_source/signup_data_source.dart';



part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupDataSource signupDataSource;
  SignupBloc({required this.signupDataSource}) : super(SignupState.initial()) {
    on<RegisterUserEvent>((event, emit) async {
      // TODO: implement event handler

      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..otpError=false
        ..error = ''

      ));

      final result = await signupDataSource.registerUser(email: event.email, password: event.password,name: event.name,number: event.number);


      print("result");
      print(result);
      print("result");


      return result.fold((error) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoading = false
          ..error = error));
      }, (result) async {
        print('r');
        if (result != null) {

          emit(state.rebuild((b) =>
          b
            ..isSuccess = true
            ..isLoading = false
            ..signupModel = result));

        }
        else {
          emit(state.rebuild((b) =>
          b
            ..isLoading = false
            ..isSuccess = false
            ..error = "failed"
          ));
        }
      });
    });

    on<OtpSubmitEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..otpSuccess = false
        ..otpError=false
        ..error = ''

      ));

      final result = await signupDataSource.validateOtp(otp: event.otp);



      print("result");
      print(result);
      print("result");


      return result.fold((error) async {
        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoading = false
          ..error = error
          ..otpError=true

        ));
      }, (result) async {
        print('r');
        if (result != null) {

          emit(state.rebuild((b) =>
          b
            ..isSuccess = false
            ..isLoading = false
            ..otpSuccess = true));

        }
        else {
          emit(state.rebuild((b) =>
          b
            ..isLoading = false
            ..isSuccess = false
            ..error = "failed"
            ..otpError=true
          ));
        }
      });
    });
  }
}
