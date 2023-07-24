import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/features/flight_search/data/model/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors_constants.dart';

class GuestDetailWidget extends StatelessWidget {
  final String passengerType;
  const GuestDetailWidget({super.key, required this.passengerType});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            passengerType,
            style: TextStyle(
              color: ColorsConstants.darkTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          Divider(
            color: ColorsConstants.mainColor,
            // height: 0.5,
          ),
          Row(
            children: [
              inputWidget(heading: 'First Name*', hint: 'John'),
              SizedBox(width: 20.w,),
              inputWidget(heading: 'Last Name*', hint: 'Doe')
            ],
          ),

          SizedBox(height: 15.h,),
          Row(
            children: [
              inputWidget(heading: 'Gender', hint: 'Male'),
              SizedBox(width: 20.w,),
              inputWidget(
                  heading: 'Date of Birth',
                  hint: 'DD/MM/YYYY',

              )
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              inputWidget(
                  heading: 'Nationality',
                  hint: 'United Kingdom',
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              inputWidget(
                heading: 'Phone Number',
                hint: '+971 52 433 2232',
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              inputWidget(
                heading: 'Email*',
                hint: 'abc@gmail.com',
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Booking Confirmation Will Be Sent To This Email Address',
            style: TextStyle(
            color: ColorsConstants.liteTextColor,
            fontSize: 10.sp,
            // fontWeight: FontWeight.w500
          ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Passport Detail',
                  style: TextStyle(
                    color: ColorsConstants.mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Please enter detail exactly as they appear on your Passport/Travel document',
                  style: TextStyle(
                    color: ColorsConstants.liteTextColor,
                    fontSize: 10.sp,
                    // fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              inputWidget(heading: 'Passport Number*', hint: 'passport number'),
              SizedBox(width: 20.w,),
              inputWidget(
                heading: 'Date of Expiry',
                hint: 'DD/MM/YYYY',

              )
            ],
          ),

        ],
      ),

    );
  }
  Widget inputWidget({
    required String heading
    ,required String hint,
    Widget? prefix}){

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                color: ColorsConstants.darkTextColor,
                fontSize: 12.sp,
                // fontWeight: FontWeight.w500
            ),
          ),
          TextFormField(
            style: const TextStyle(
              color: ColorsConstants.darkTextColor,
            ),
            autofocus: false,

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.h),
              hintText: hint ?? "",
              filled: true,
              isDense: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: ColorsConstants.liteTextColor,

                fontSize: 14.sp,
              ),
              prefixIcon: prefix

            ),

          ),
        ],
      ),
    );

  }
}
