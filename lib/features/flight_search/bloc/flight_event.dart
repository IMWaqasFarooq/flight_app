part of 'flight_bloc.dart';

@immutable
abstract class FlightEvent {}


class SearchFlightEvent extends FlightEvent{
  final TravelData travelData ;

  SearchFlightEvent({
    required this.travelData,
  });
}

