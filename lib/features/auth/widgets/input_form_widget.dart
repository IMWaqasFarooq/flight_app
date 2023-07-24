import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInputWidget extends StatelessWidget {
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String? hintText,headingText;
  final TextInputType? keyboardType;

  const FormInputWidget(
      {this.keyboardType,
        this.obscureText,
        required this.controller,
        this.validator,
        this.textInputAction,
        this.hintText,
        this.headingText,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(headingText !=null)...[
          Text(
              headingText??"",
            style: TextStyle(
              color: ColorsConstants.darkTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp
            ),
          ),
          SizedBox(
            height: 8.h,
          )
          ],

        TextFormField(
          style: const TextStyle(
            color: ColorsConstants.darkTextColor,
          ),
          obscureText: obscureText ?? false,
          autofocus: false,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            hintText: hintText ?? "",
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: ColorsConstants.liteTextColor,

              fontSize: 14.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                50.r,
              ),
              borderSide: BorderSide(
                color: ColorsConstants.formBorderColor,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(
                color: ColorsConstants.formBorderColor,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(
                color: ColorsConstants.mainColor,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
