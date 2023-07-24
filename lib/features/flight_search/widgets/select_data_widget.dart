import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';

import '../../../core/constants/colors_constants.dart';
import 'guest_input_dialog.dart';

class SelectDataWidget extends StatelessWidget {
  final String hintText, icon, headingText;
  final Function(String?) onSelected;
  final bool? isDate, isGuest, isAirport;
  final TextEditingController? controller;

  SelectDataWidget({
    Key? key,
    required this.headingText,
    required this.hintText,
    required this.onSelected,
    required this.icon,
    this.isDate = false,
    this.isGuest = false,
    this.isAirport = false,
    this.controller,

  }) : super(key: key);
  final focus = FocusNode();

  final List<String> suggestions = [
    'DXB',
    'ISB',
    'JFK',
    'LHR',
    'CDG',
    'SFO',
    'PEK',
    'LHE',
    'HND',
    'DEL',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText,
          style: TextStyle(
              color: ColorsConstants.darkTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp),
        ),
        if((isGuest??false) || (isDate??false))
        SizedBox(height: 5.h,),
        Row(
          children: [
            SvgPicture.asset(icon,color: ColorsConstants.mainColor,width: 23.w, height: 23.w,),
            SizedBox(
              width: 5.w,
            ),
            if(isAirport??false)
              Expanded(
                child:SearchField(
                  controller: controller,
                  searchStyle: TextStyle(
                      color: ColorsConstants.liteTextColor,
                      fontSize: 13.sp),
                  suggestionStyle: TextStyle(
                      color: ColorsConstants.liteTextColor,
                      fontSize: 13.sp),
                  onSearchTextChanged: (query) {
                    final filter = suggestions
                        .where((element) => element
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) => SearchFieldListItem<String>(e))
                        .toList();
                  },
                  hint: hintText,
                  suggestionsDecoration: SuggestionDecoration(
                      padding:  EdgeInsets.all(5.r),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  suggestions: suggestions
                      .map((e) => SearchFieldListItem<String>(e))
                      .toList(),
                  focusNode: focus,
                  suggestionState: Suggestion.expand,
                  onSubmit: (value){
                    onSelected(value);
                  },
                  onSuggestionTap: (SearchFieldListItem<String> x) {
                    focus.unfocus();
                    onSelected(x.searchKey);
                  },
                )
            ),
            if(isDate??false)
              Expanded(
                child: TextField(
                  controller: controller,

                  //editing controller of this TextField
                  decoration: InputDecoration(
                      isDense: true,
                      hintStyle: TextStyle(
                          color: ColorsConstants.liteTextColor,
                          fontSize: 13.sp),

                      hintText: hintText//label text of field
                  ),
                  readOnly: true,

                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));
                    //
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate);
                      onSelected(formattedDate);//formatted date output using intl package =>  2021-03-16

                      controller!.text=formattedDate;
                    } else {}
                  },
                )
            ),
            if(isGuest??false)
              Expanded(
                  child: TextField(
                    controller: controller,

                    //editing controller of this TextField
                    decoration: InputDecoration(
                        isDense: true,
                        hintStyle: TextStyle(
                            color: ColorsConstants.liteTextColor,
                            fontSize: 13.sp),

                        hintText: hintText//label text of field
                    ),
                    readOnly: true,

                    //set it true, so that user will not able to edit text
                    onTap: () async {

                      final result = await showDialog(
                        context: context,
                        builder: (context) => GuestInputDialog(),
                      );


                      if (result != null) {
                        int totalGuests = result['adults'] + result['children'] + result['infants'];

                        controller!.text = '$totalGuests Guest';
                        onSelected('${result['adults']},${result['children']},${result['infants']}');
                        print('Selected Guests: Adults-${result['adults']}, Children-${result['children']}, Infants-${result['infants']}');
                      }
                    },
                  )
              ),

          ],
        ),
      ],
    );
  }
}
