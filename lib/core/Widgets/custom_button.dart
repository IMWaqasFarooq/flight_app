import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor??ColorsConstants.mainColor, // Use the primary color from the theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r), // Adjust the value to make the button more or less rounded
        ),
        elevation: 5.r, // Set the shadow depth
        shadowColor: bgColor==null?ColorsConstants.mainColor:Colors.grey.withOpacity(0.5), // Change the shadow color if needed
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h,vertical: 8.w),
        child: Text(
          text,
          style: TextStyle(
            color: textColor??Colors.white, // Text color set to white
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
