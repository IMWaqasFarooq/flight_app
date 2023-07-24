import 'package:built_value/built_value.dart';
import 'package:flight_app/features/auth/sign_up/data/model/signup_model.dart';
import 'package:flight_app/features/flight_search/data/model/flight_model.dart';


part 'flight_state.g.dart';

abstract class FlightState implements Built<FlightState,FlightStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  FlightModel? get flightModel;



  FlightState._();

  factory FlightState([void Function(FlightStateBuilder) updates]) = _$FlightState;
  //flutter packages pub run build_runner build --delete-conflicting-outputs

  factory FlightState.initial() {
    return FlightState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error = ''
      ..flightModel = FlightModel()


    );
  }
}