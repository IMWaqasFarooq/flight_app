import 'package:flight_app/core/Widgets/custom_button.dart';
import 'package:flight_app/core/Widgets/custom_rounded_button.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/features/flight_results/flight_results_page.dart';
import 'package:flight_app/features/flight_search/bloc/flight_bloc.dart';
import 'package:flight_app/features/flight_search/data/data_source/flight_data_source.dart';
import 'package:flight_app/features/flight_search/data/model/travel_data.dart';
import 'package:flight_app/features/flight_search/widgets/home_header_widget.dart';
import 'package:flight_app/features/flight_search/widgets/select_data_widget.dart';
import 'package:flight_app/features/flight_search/widgets/tab_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

import '../../core/constants/colors_constants.dart';
import '../../core/di/dependency_injection.dart';
import '../../core/functions/validators.dart';
import 'bloc/flight_state.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({super.key});

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage>
    with TickerProviderStateMixin {
  late TextEditingController dateController,guestController,
      originController,destinationController;


  late TravelData travelData;

  late FlightBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    dateController = TextEditingController();
    guestController = TextEditingController();
    originController = TextEditingController();
    destinationController = TextEditingController();
    travelData = TravelData();
    _bloc = FlightBloc(flightDataSource: sl<FlightDataSource>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<FlightBloc, FlightState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isSuccess!) {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        FlightResultsPage(
                          flightModel: state.flightModel!,
                          travelData: travelData,

                        )
                )
            );
          } else if (state.error!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.error ?? "");
          }
        },
        child: BlocBuilder<FlightBloc, FlightState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading!,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      HomeHeaderWidget(),
                      Stack(
                        children: [
                          SvgPicture.asset(ImageConstants.destinationBg),
                          Positioned(
                            left: 15.w,
                            right: 15.w,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                  color: ColorsConstants.whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      topRight: Radius.circular(15.r))),
                              child: TabBar(
                                unselectedLabelColor:
                                    ColorsConstants.liteTextColor,
                                labelColor: ColorsConstants.mainColor,
                                indicatorColor: Colors.white,
                                indicatorWeight: 3,
                                controller:
                                    TabController(length: 3, vsync: this),
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                padding: EdgeInsets.zero,
                                tabs: [
                                  Tab(
                                      child: TabWidget(
                                    text: 'Flights',
                                    icon: ImageConstants.planeIcon,
                                  )),
                                  Tab(
                                      child: TabWidget(
                                    text: 'Hotels',
                                    icon: ImageConstants.hotelIcon,
                                  )),
                                  Tab(
                                      child: TabWidget(
                                    text: 'Car Rental',
                                    icon: ImageConstants.carIcon,
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorsConstants.bgColor,
                              ColorsConstants.whiteColor,
                              ColorsConstants.whiteColor,
                            ],
                          )),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomRoundedButton(
                                      text: 'Business',
                                      icon: Icons.keyboard_arrow_down,
                                      onPressed: () {},
                                    ),
                                    CustomRoundedButton(
                                      text: 'One Way',
                                      bgColor: ColorsConstants.mainColor,
                                      textColor: ColorsConstants.whiteColor,
                                      onPressed: () {},
                                    ),
                                    CustomRoundedButton(
                                      onPressed: () {},
                                      text: 'Round Trip',
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: SelectDataWidget(
                                        controller: originController,
                                        isAirport: true,
                                        headingText: 'Flying from',
                                        icon: ImageConstants.departureIcon,
                                        hintText: 'Dubai(DXB)',
                                        onSelected: (String? option) {
                                          if (option != null) {
                                            travelData.airportOriginCode = option;
                                            print('Selected: $option');
                                          }

                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Flexible(
                                      child: SelectDataWidget(
                                        controller: destinationController,
                                        isAirport: true,
                                        headingText: 'Flying to',
                                        icon: ImageConstants.arrivalIcon,
                                        hintText: 'Sharjah(SHJ)',
                                        onSelected: (String? option) {
                                          if (option != null) {
                                            if (option ==
                                                travelData.airportOriginCode) {

                                              Fluttertoast.showToast(
                                                  msg:
                                                      "select valid destination");

                                            }
                                            travelData.airportDestinationCode =
                                                option;
                                            print('Selected: $option');
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: SelectDataWidget(
                                      controller: dateController,
                                      headingText: 'Departure',
                                      icon: ImageConstants.calendarIcon,
                                      hintText: DateFormat('dd MMM yyyy')
                                          .format(DateTime.now())
                                          .toString(),
                                      isDate: true,
                                      onSelected: (String? option) {
                                        if (option != null) {
                                          travelData.departureDate = option;
                                          print('Selected: $option');
                                        }
                                      },
                                    )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Flexible(
                                        child: SelectDataWidget(
                                      isGuest: true,
                                      controller: guestController,
                                      headingText: 'Guests',
                                      icon: ImageConstants.guestIcon,
                                      hintText: '1 Guest',
                                      onSelected: (String? option) {
                                        if (option != null) {
                                          List<String> guestList =
                                              option.split(',');
                                          travelData.adults =
                                              int.parse(guestList[0]);
                                          travelData.children =
                                              int.parse(guestList[1]);
                                          travelData.infants =
                                              int.parse(guestList[2]);
                                          print('Selected: $option');
                                        }
                                      },
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomButton(
                                  text: 'Search',
                                  onPressed: () {
                                    if (validateSearchData(travelData)) {
                                      _bloc.add(SearchFlightEvent(
                                          travelData: travelData));
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
