import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/core/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

verifyCodeDialog({
  required BuildContext context,
  required ValueChanged<int> onChanged,


}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      TextEditingController controller =TextEditingController();

      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
              decoration: BoxDecoration(
                color: ColorsConstants.whiteColor,
                borderRadius: BorderRadius.circular(
                  40.r,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(ImageConstants.checkedIcon),

                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Verify Code',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsConstants.mainColor
                    ),

                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "We Sent An OTP Code On Your Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorsConstants.liteTextColor
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Pinput(
                    controller: controller,
                    length: 6,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    onCompleted: (pin){
                      onChanged(int.parse(pin));
                    },
                    showCursor: false,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // CustomButton(
                  //     text: 'Validate',
                  //   onPressed: (){
                  //     onChanged(int.parse(controller.text));
                  //
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
