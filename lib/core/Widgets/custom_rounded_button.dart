import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;
  final IconData? icon;

  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.bgColor,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          backgroundColor: bgColor??ColorsConstants.whiteColor, // Use the primary color from the theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r), // Adjust the value to make the button more or less rounded
          ),
          elevation: 2.r, // Set the shadow depth
          shadowColor: bgColor??Colors.grey.withOpacity(0.5), // Change the shadow color if needed
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor??ColorsConstants.liteTextColor, // Text color set to white
                fontSize: 12.sp,
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 2.w),
              Icon(icon,color: ColorsConstants.liteTextColor),

            ],
          ],
        ),
      ),
    );
  }
}
