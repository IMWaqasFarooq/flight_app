import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../core/constants/image_constants.dart';
import '../../flight_results/widgets/circular_icon_widget.dart';

class BookingAppbarWidget extends StatelessWidget {
  const BookingAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsConstants.mainColor,
        padding: EdgeInsets.fromLTRB(5.w, 15.h,20.w,15.h),
        child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  icon: Icon(
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios_new
                  )
              ),
              Expanded(
                child: Text(
                  "Your Flight Booking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsConstants.whiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SvgPicture.asset(ImageConstants.dummyProfileIcon,width: 36.sp,),
            ],
          ),
        )
    );
  }
}
