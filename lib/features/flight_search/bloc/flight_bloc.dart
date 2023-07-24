import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flight_app/features/flight_search/data/model/travel_data.dart';
import 'package:meta/meta.dart';

import '../data/data_source/flight_data_source.dart';
import 'flight_state.dart';

part 'flight_event.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightDataSource flightDataSource;
  FlightBloc({required this.flightDataSource}) : super(FlightState.initial()) {
    on<SearchFlightEvent>((event, emit) async {
      // TODO: implement event handler

      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''

      ));

      final result = await flightDataSource.searchFlight(travelData: event.travelData);

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
            ..flightModel = result));

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
  }
}
