import 'dart:io';

import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/features/book_flight/book_flight_page.dart';
import 'package:flight_app/features/flight_results/widgets/circular_icon_widget.dart';
import 'package:flight_app/features/flight_results/widgets/flight_header_widget.dart';
import 'package:flight_app/features/flight_results/widgets/flight_widget.dart';
import 'package:flight_app/features/flight_search/data/model/flight_model.dart';
import 'package:flight_app/features/flight_search/data/model/travel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Widgets/custom_rounded_button.dart';

class FlightResultsPage extends StatefulWidget {
  final FlightModel flightModel;
  final TravelData travelData;
  const FlightResultsPage({
    super.key,
    required this.flightModel,
    required this.travelData
  });

  @override
  State<FlightResultsPage> createState() => _FlightResultsPageState();
}

class _FlightResultsPageState extends State<FlightResultsPage> {
  late FlightModel flightModel;

  @override
  void initState() {
    // TODO: implement initState
    flightModel = widget.flightModel;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlightHeaderWidget(
            travelData: widget.travelData,
            onBackPressed: (){
              Navigator.pop(context);
            },

          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorsConstants.bgColor,
                      ColorsConstants.whiteColor,
                      ColorsConstants.whiteColor,
                    ],
                  )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: '${flightModel.data!.flights!.length} Flights',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorsConstants.darkTextColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Available',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConstants.darkTextColor,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      CircularIconWidget(icon: ImageConstants.filterIcon)

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomRoundedButton(
                        text: 'Cheap Price',
                        icon: Icons.keyboard_arrow_down,
                        onPressed: () {  },
                      ),
                      SizedBox(width: 10.w,),
                      CustomRoundedButton(
                        text: 'Stop Included',
                        icon: Icons.keyboard_arrow_down,
                        onPressed: () {  },
                      ),

                    ],
                  ),

              Flexible(
                child: ListView.separated(
                  itemCount: flightModel.data!.flights!.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.h),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookFlightPage(
                                      passengers: flightModel.data!.flights![index].passengers!,
                                    )));
                      },
                      child: FlightWidget(
                        flights: flightModel.data!.flights![index],
                      ),
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) =>
                      SizedBox(height: 15.h),
                ),
              ),

                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}

