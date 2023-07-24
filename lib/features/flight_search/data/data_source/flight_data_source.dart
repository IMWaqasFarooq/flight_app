import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flight_app/core/constants/key_constants.dart';
import 'package:flight_app/core/preference/preferences.dart';
import 'package:flight_app/features/flight_search/data/model/flight_model.dart';


import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/error_constants.dart';
import '../model/travel_data.dart';

abstract class FlightDataSource {
  Future<Either<String, FlightModel>> searchFlight({
    required TravelData travelData,

  });


}

class FlightDataSourceImpl extends FlightDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  FlightDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, FlightModel>> searchFlight({
    required TravelData travelData,
  }) async {
    if (await networkInfo.hasConnection) {

      try {

        Options options = Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer ${Preferences.preferences!.getString(KeyConstants.keyUserToken)}',
          },
        );

        Map<String, dynamic> data = {
          'journeyType': travelData.journeyType,
          'OriginDestinationInfo[0][departureDate]': travelData.departureDate,
          'OriginDestinationInfo[0][returnDate]': travelData.returnDate,
          'OriginDestinationInfo[0][airportOriginCode]':travelData.airportOriginCode,
          'OriginDestinationInfo[0][airportDestinationCode]': travelData.airportDestinationCode,
          'class': travelData.travelClass,
          'adults': travelData.adults,
          'childs': travelData.children,
          'infants': travelData.infants,
          'directFlight': travelData.directFlight,
        };

        FormData formData = FormData.fromMap(data);

        final result = await dio.post(
          AppConstants.searchFlight,
          data: formData,
          options: options
        );

        print("response..${json.decode(result.data)}");

        FlightModel flightModel =FlightModel.fromJson(json.decode(result.data));

        if(flightModel.status!){


          return Right(flightModel);

        }else{
          return left(flightModel.message??"");
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