
import 'package:bloc/bloc.dart';
import 'package:flight_app/features/auth/login/bloc/login_state.dart';
import 'package:meta/meta.dart';

import '../data/data_source/login_data_source.dart';
import '../data/model/login_model.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginDataSource loginDataSource;
  LoginBloc({required this.loginDataSource}) : super(LoginState.initial()) {
    on<LoginUserEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..otpError=false
        ..error = ''

      ));

      final result = await loginDataSource.loginUser(email: event.email, password: event.password);


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
              ..loginModel = result));

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

      final result = await loginDataSource.validateOtp(otp: event.otp);


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
              ..otpSuccess = true
            ));

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
