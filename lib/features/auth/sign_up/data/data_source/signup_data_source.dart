import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flight_app/core/constants/key_constants.dart';
import 'package:flight_app/core/preference/preferences.dart';
import 'package:flight_app/features/auth/sign_up/data/model/signup_model.dart';


import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/error_constants.dart';
import '../../../login/data/model/otp_model.dart';


abstract class SignupDataSource {
  Future<Either<String, SignupModel>> registerUser({
    required String email,
    required String password,
    required String name,
    required String number,
  });

  Future<Either<String, OtpModel>> validateOtp({
    required int otp,
  });
}

class SignupDataSourceImpl extends SignupDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  SignupDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, SignupModel>> registerUser({
    required String email,
    required String password,
    required String name,
    required String number,
  }) async {
    if (await networkInfo.hasConnection) {
      Map<String, dynamic> requestBody = {
        "firstName" : name,
        "lastName" : "Test",
        "email": email,
        "password": password,
        "phone" : number,
        "password" : password,
        "refer_user" : ""
      };

      try {

        final result = await dio.post(
          AppConstants.register,
          data: requestBody,
        );

        print("response..${json.decode(result.data)}");

        SignupModel signupModel =SignupModel.fromJson(json.decode(result.data));

        if(signupModel.status!){
          Preferences.preferences!.setInt(KeyConstants.keyUserId, signupModel.data!.userId!);
          Preferences.preferences!.setString(KeyConstants.keyEmail, signupModel.data!.registeredEmail!);

          return Right(signupModel);

        }else{
          return left(signupModel.message??"");
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