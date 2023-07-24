import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingHeaderWidget extends StatelessWidget {
  const BookingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        roundedButton(
            text: 'Customise',
            icon:ImageConstants.luggageIcon,
          bgColor: ColorsConstants.mainColor,
          iconColor: ColorsConstants.whiteColor
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Divider(
              color: ColorsConstants.mainColor,
              height: 2,
            ),
          ),
        ),
        roundedButton(
            text: 'Passenger info',
            icon:ImageConstants.guestIcon,
            iconColor: ColorsConstants.mainColor
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Divider(
              color: ColorsConstants.mainColor,
              height: 2,
            ),
          ),
        ),
        roundedButton(
            text: 'Payment',
            icon:ImageConstants.paymentIcon,
            iconColor: ColorsConstants.liteTextColor
        ),
      ],
    );
  }

  Widget roundedButton({
    required String text,
    required String icon,
    required Color iconColor, Color? bgColor}){

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: bgColor??Colors.transparent,
            border: Border.all(
              width: 2.w,
              color: bgColor??iconColor??Colors.transparent
            )
          ),
          child: SvgPicture.asset(icon,color: iconColor,width: 24.sp,height: 24.sp,),
        ),
        SizedBox(height: 8.h,),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp
          ),
        )
      ],
    );
  }
}
