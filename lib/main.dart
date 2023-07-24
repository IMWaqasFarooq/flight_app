import 'package:flight_app/core/constants/key_constants.dart';
import 'package:flight_app/features/auth/login/login_page.dart';
import 'package:flight_app/features/flight_search/flight_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'core/constants/colors_constants.dart';
import 'core/preference/preferences.dart';
import 'core/di/dependency_injection.dart' as di;


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flights',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: ColorsConstants.primaryTheme,
              focusColor: ColorsConstants.primaryTheme,
              // fontFamily:'Montserrat'
            ),
            // home: Preferences.preferences!.getBool(KeyConstants.keyLoggedIn)??false
            //     ?FlightSearchPage() :LoginPage(),
            home:LoginPage()
          );
        });
  }
}
