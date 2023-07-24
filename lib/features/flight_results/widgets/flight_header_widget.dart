import 'dart:io';

import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/features/flight_results/widgets/circular_icon_widget.dart';
import 'package:flight_app/features/flight_search/data/model/travel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors_constants.dart';

class FlightHeaderWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final TravelData travelData;

   const FlightHeaderWidget({super.key,
     required this.onBackPressed,
     required this.travelData});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsConstants.mainColor,
        padding: EdgeInsets.fromLTRB(5.w, 15.h,20.w,15.h),
        child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              IconButton(
                  onPressed: onBackPressed,
                  color: Colors.white,
                  icon: Icon(
                      Platform.isAndroid
                      ? Icons.arrow_back
                      : Icons.arrow_back_ios_new
                  )
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          travelData.airportOriginCode,
                          style: TextStyle(
                            color: ColorsConstants.whiteColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        SvgPicture.asset(ImageConstants.swapIcon),
                        SizedBox(width: 5.w,),
                        Text(
                          travelData.airportDestinationCode,
                          style: TextStyle(
                              color: ColorsConstants.whiteColor,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      travelData.departureDate,
                      style: TextStyle(
                          color: ColorsConstants.whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConstants.guestIcon),
                        SizedBox(width: 5.w,),
                        Text(
                          getGuests(),
                          style: TextStyle(
                              color: ColorsConstants.whiteColor,
                              fontSize: 14.sp,
                              // fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),



                  ],
                ),
              ),
              CircularIconWidget(icon: ImageConstants.editIcon),
            ],
          ),
        )
    );
  }

  String getGuests(){

    String guests =travelData.adults.toString();
    guests += travelData.adults>1?' Adults':' Adult';
    if(travelData.children>0){
      guests += ', ${travelData.children.toString()}';
      guests += travelData.children>1?' Children':' Child';
    }
    if(travelData.infants>0){
      guests += ', ${travelData.infants.toString()}';
      guests += travelData.infants>1?' Infants':' Infant';
    }

    return guests;

  }
}
