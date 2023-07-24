import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/image_constants.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xFFFFFF),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
              ImageConstants.dummyProfileIcon,
            width: 45.w,
            height: 45.w,
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorsConstants.liteTextColor
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SvgPicture.asset(ImageConstants.wavingHand),
                ],
              ),
              Text(
                'Julia',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorsConstants.darkTextColor
                ),
              ),
            ],
          ),
          Spacer(),

         getIconWidget(ImageConstants.bellIcon),
          SizedBox(width: 10.w,),
          getIconWidget(ImageConstants.menuIcon),

        ],
      ),
    );
  }

  Widget getIconWidget(String icon){

    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
          color: ColorsConstants.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.3),
            )
          ]
      ),
      child: SvgPicture.asset(icon,width: 24.sp,),
    );
  }
}
