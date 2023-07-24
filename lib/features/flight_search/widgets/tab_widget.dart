import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/image_constants.dart';

class TabWidget extends StatelessWidget {
  final String text, icon;
  const TabWidget({
    super.key,
    required this.text,
    required this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
              icon,
              width: 18.w),
          SizedBox(width: 5.w),
          Flexible(child: Text(text,textAlign: TextAlign.center,)),
        ]
    );
  }
}
