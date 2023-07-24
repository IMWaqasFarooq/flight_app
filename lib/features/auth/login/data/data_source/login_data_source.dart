import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flight_app/core/constants/key_constants.dart';
import 'package:flight_app/core/preference/preferences.dart';


import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/error_constants.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';

abstract class LoginDataSource {
  Future<Either<String, LoginModel>> loginUser({
    required String email,
    required String password,
  });

  Future<Either<String, OtpModel>> validateOtp({
    required int otp,
  });
}

class LoginDataSourceImpl extends LoginDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  LoginDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, LoginModel>> loginUser({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.hasConnection) {
      Map<String, dynamic> requestBody = {
        "email":email,
        "password":password,
      };

      try {

        final result = await dio.post(
            AppConstants.login,
            data: requestBody,
        );

        print("response..${json.decode(result.data)}");

        LoginModel loginModel =LoginModel.fromJson(json.decode(result.data));

        if(loginModel.status!){
          Preferences.preferences!.setInt(KeyConstants.keyUserId, loginModel.data!.userId!);
          Preferences.preferences!.setString(KeyConstants.keyEmail, loginModel.data!.registeredEmail!);

          return Right(loginModel);

        }else{
          return left(loginModel.message??"");
        }

      } on DioError catch (ex) {

        return  Left(ErrorsConstants.networkError);
      } catch (e) {
        print(e);
        return  Left(ErrorsConstants.somethingWrong);
      }
    } else {
      return  Left(ErrorsConstants.networkError);
    }
  }

  @override
  Future<Either<String, OtpModel>> validateOtp({required int otp}) async {
    if (await networkInfo.hasConnection) {
      Map<String, dynamic> requestBody = {
        "user_id":Preferences.preferences!.getInt(KeyConstants.keyUserId),
        "otp":otp,
        "app" : "mobile",
        "device_type" : Platform.isIOS?"ios":"android"
      };

      try {

        final result = await dio.post(
          AppConstants.loginOtp,
          data: requestBody,
        );

        print("response..${json.decode(result.data)}");

        OtpModel otpModel =OtpModel.fromJson(json.decode(result.data));

        if(otpModel.status!){
          Preferences.preferences!.setString(KeyConstants.keyUserToken, otpModel.data!.token!);
          // Preferences.preferences!.setString(KeyConstants.keyPrivateKey, otpModel.data!.privateKey!);

          return Right(otpModel);

        }else{
          return left(otpModel.message??"");
        }

      } on DioError catch (ex) {

        return  Left(ErrorsConstants.networkError);
      } catch (e) {
        print(e);
        return  Left(ErrorsConstants.somethingWrong);
      }
    } else {
      return  Left(ErrorsConstants.networkError);
    }
  }
}