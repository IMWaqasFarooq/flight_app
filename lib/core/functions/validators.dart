import 'package:flight_app/features/flight_search/data/model/travel_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Field should not be empty';
  }
  // reg expression for email validation
  if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? validateName(String? value) {
  RegExp regex = RegExp(r'^.{3,}$');
  if (value!.isEmpty) {
    return 'Field should not be empty';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter valid name';
  }
  return null;
}

String? validatePassword(String? value) {
  RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
  if (value!.isEmpty) {
    return 'Field should not be empty';
  } else if (!regex.hasMatch(value)) {
    return 'at least 8 characters including upper and lowercase ';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value,String oldPassword) {
  if (value!.isEmpty) {
    return 'Field should not be empty';
  } else if (!(value == oldPassword)) {
    return 'password didnt match';
  } else {
    return null;
  }
}

String? validatePhoneNumber(String? value) {
  if (value!.isEmpty) {
    return 'Field should not be empty';
  } else {
    return null;
  }
}

bool validateSearchData(TravelData travelData){

  if(travelData.airportOriginCode.isEmpty){
    Fluttertoast.showToast(msg: "Please Select Origin");
    return false;
  }else if(travelData.airportDestinationCode.isEmpty){
    Fluttertoast.showToast(msg: "Please Select Destination");
    return false;
  }else  if(travelData.departureDate.isEmpty){
    Fluttertoast.showToast(msg: "Please Select Date");
    return false;
  }else  if(travelData.airportDestinationCode == travelData.airportOriginCode){
    Fluttertoast.showToast(msg: "select valid destination");
    return false;
  }

  return true;
}