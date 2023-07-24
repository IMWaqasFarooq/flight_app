import 'package:flight_app/features/flight_search/data/model/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../core/constants/image_constants.dart';

class FlightWidget extends StatelessWidget {
  final Flights flights;
  const FlightWidget({super.key,required this.flights});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
          color: ColorsConstants.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.grey.withOpacity(0.3),
            ),

          ]
      ),

      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ImageConstants.dummyProfileIcon,
                width: 32.w,
                height: 32.w,
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Text(
                  flights.originDestinationOptions![0].tourSegments![0].airlineName!,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorsConstants.darkTextColor,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),


              Text(
                '\$${flights.fareTotal!.total!.amount}',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorsConstants.mainColor,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              airportWidget(
                  airport: flights.originDestinationOptions![0].tourSegments!.first.departureAirportCode!,
                time: getFormattedTime(flights.originDestinationOptions![0].tourSegments!.first.departureDateTime!)
              ),
              if(flights.originDestinationOptions![0].totalStops! <1)...[
                airportWidget(
                  nonStop: true,
                    airport: flights.originDestinationOptions![0].tourSegments!.first.departureAirportCode!,
                    time: convertMinutesToHoursAndMinutes(int.parse(flights.originDestinationOptions![0].tourSegments!.first.journeyDuration!) )
                ),

              ]else...[

                  airportWidget(
                      isTransit: true,
                      airport: '${flights.originDestinationOptions![0].totalStops!}, stop',
                      time: getTotalTime(flights.originDestinationOptions![0].tourSegments!)
                  ),
              ],

              airportWidget(
                  airport: flights.originDestinationOptions![0].tourSegments!.last.arrivalAirportCode!,
                  time: getFormattedTime(flights.originDestinationOptions![0].tourSegments!.first.arrivalDateTime!)

              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Divider(
            color: ColorsConstants.mainColor,
            // height: 0.5,
          ),
          Row(
            children: [
              buttonWidget(
                text: 'Economy Light'
              ),
              SizedBox(width: 5.w,),
              buttonWidget(
                icon: ImageConstants.luggageIcon,
                  text: '1x${flights.passengers!.first.baggage![0]}'
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    'Show Details',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorsConstants.mainColor,
                      // fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorsConstants.mainColor,
                    size: 16.sp,),
                ],
              )
            ],
          )




        ],
      ),
    );
  }

  Widget airportWidget({
    required String airport,
    required String time,
    bool? isTransit,
    bool? nonStop
  }){

    return Column(
      children: [

        Text(
          nonStop??false?"":airport,
          style: TextStyle(
              fontSize: 12.sp,
              color: ColorsConstants.darkTextColor,
              // fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 10.h,),
        SvgPicture.asset((isTransit??false)||(nonStop??false)
            ?ImageConstants.planeIcon:ImageConstants.spotIcon),
        SizedBox(height: 10.h,),
        Row(
          children: [
            if((isTransit??false)||(nonStop??false))...[
              SvgPicture.asset(ImageConstants.clockIcon),
              SizedBox(width: 5.w,)
            ],
            Text(
            time,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorsConstants.darkTextColor,
                // fontWeight: FontWeight.w500
              ),
            ),

          ],
        ),

      ],
    );
  }

 String getFormattedTime(String time){
   DateTime dateTime = DateTime.parse(time);

   return DateFormat('HH:mm').format(dateTime);
 }

 String getTotalTime(List<TourSegments>? tourSegments){
    int time = 0;
    for(int i =0; i< tourSegments!.length; i++){

      time += int.parse(tourSegments[i].journeyDuration!);

    }
    return convertMinutesToHoursAndMinutes(time);
 }

  String convertMinutesToHoursAndMinutes(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // Get the number of hours
    int remainingMinutes = totalMinutes % 60; // Get the remaining minutes

    String result = '';

    if (hours > 0) {
      result += '${hours}h ';
    }

    if (remainingMinutes > 0) {
      result += '${remainingMinutes}m';
    }

    return result.trim();
  }



  Widget buttonWidget({required String text, String? icon}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xFFF2FBFF),
        border: Border.all(
          width: 1.w,
          color: Color(0xFFE1EDF2)
        )
      ),
      child: Row(
        children: [
          if (icon != null) ...[

            SvgPicture.asset(icon),
            SizedBox(width: 2.w),

          ],
          Text(
            text,
            style: TextStyle(
              color: ColorsConstants.darkTextColor, // Text color set to white
              fontSize: 10.sp,
            ),
          ),

        ],
      ),
    );

  }
}
