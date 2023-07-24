import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final String title;

  CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(unselectedWidgetColor: ColorsConstants.mainColor),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Transform.translate(
              offset:  Offset(-15.w, 0),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 13.sp,
                  color: ColorsConstants.liteTextColor
                ),
              )),
          value: _isChecked,
          activeColor: ColorsConstants.mainColor,
          onChanged: (newValue) {
            setState(() {
              _isChecked = newValue ?? false;
              widget.onChanged(_isChecked);
            });
          },
        ),


    );
  }
}
