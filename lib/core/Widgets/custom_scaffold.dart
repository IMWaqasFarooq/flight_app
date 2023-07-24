
import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({required this.body}); // and maybe other Scaffold properties

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: this.body,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  ColorsConstants.bgColor,
                  ColorsConstants.whiteColor,
                ],
              )

          )),
    );
  }
}