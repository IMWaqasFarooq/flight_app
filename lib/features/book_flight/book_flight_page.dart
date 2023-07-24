import 'package:flight_app/features/book_flight/widgets/booking_appbar_widget.dart';
import 'package:flight_app/features/book_flight/widgets/booking_header_widget.dart';
import 'package:flight_app/features/book_flight/widgets/guest_detail_widget.dart';
import 'package:flight_app/features/flight_search/data/model/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors_constants.dart';

class BookFlightPage extends StatefulWidget {
  final List<Passengers> passengers;
  const BookFlightPage({super.key,required this.passengers});

  @override
  State<BookFlightPage> createState() => _BookFlightPageState();
}

class _BookFlightPageState extends State<BookFlightPage> {
  late List<Passengers> passengers;

  List<String> passengerTypes=[];

  @override
  void initState() {
    // TODO: implement initState
    passengers = widget.passengers;
    getIndividualTypes();

    super.initState();
  }

   getIndividualTypes(){
    for (var element in passengers) {
      int quantity = element.quantity!;
      String type = element.type!;
      for(int i =0; i<quantity;i++){
        passengerTypes.add(type);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          BookingAppbarWidget(),
          Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                  children: [
                    BookingHeaderWidget(),

                    Flexible(
                      child: ListView.separated(
                        itemCount: passengerTypes.length,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return GuestDetailWidget(
                            passengerType: 'Traveler ${index+1}: ${passengerTypes[index]}',
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) =>
                            SizedBox(height: 15.h),
                      ),
                    )
                  ],
                ),

          ))
        ],
      ),
    );
  }
}
