import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors_constants.dart';

class CircularIconWidget extends StatelessWidget {
  final String icon;
  const CircularIconWidget({
    super.key,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
          color: ColorsConstants.mainColor,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.3),
            )
          ]
      ),
      child: SvgPicture.asset(icon),
    );;
  }
}
