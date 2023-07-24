import 'package:flight_app/core/Widgets/custom_scaffold.dart';
import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/core/constants/key_constants.dart';
import 'package:flight_app/core/preference/preferences.dart';
import 'package:flight_app/features/auth/login/bloc/login_bloc.dart';
import 'package:flight_app/features/auth/login/data/data_source/login_data_source.dart';
import 'package:flight_app/features/auth/sign_up/signup_page.dart';
import 'package:flight_app/core/functions/validators.dart';
import 'package:flight_app/core/Widgets/custom_button.dart';
import 'package:flight_app/features/auth/widgets/custom_checkbox.dart';
import 'package:flight_app/features/auth/widgets/input_form_widget.dart';
import 'package:flight_app/features/auth/widgets/verify_code_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

import '../../../core/di/dependency_injection.dart';
import '../../flight_search/flight_search_page.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController emailController, passwordController;
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = true;

  late LoginBloc _bloc;


  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _bloc = LoginBloc(loginDataSource: sl<LoginDataSource>());

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener

          if(state.otpSuccess!){
            if(_isChecked){
              Preferences.preferences!.setBool(KeyConstants.keyLoggedIn, true);
            }
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (context) => FlightSearchPage()));
          }else if(state.isSuccess!){
            verifyCodeDialog(context: context,onChanged: (pin){
              Navigator.pop(context);
              _bloc.add(OtpSubmitEvent(otp: pin));
            });
          }else if(state.error!.isNotEmpty){
            Fluttertoast.showToast(msg: state.error??"");
            if(state.otpError!){
              verifyCodeDialog(context: context,onChanged: (pin){
                Navigator.pop(context);
                _bloc.add(OtpSubmitEvent(otp: pin));
              });
            }
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading!,
              child: CustomScaffold(
                body: Center(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: ColorsConstants.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.3),
                          ),

                        ]
                    ),
                    margin: EdgeInsets.all(15.r),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                                ImageConstants.dummyProfileIcon
                            ),
                            SizedBox(height: 15.h,),
                            Text(
                              'Login To Existing User',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsConstants.mainColor
                              ),

                            ),
                            SizedBox(height: 20.h,),

                            FormInputWidget(
                              controller: emailController,
                              hintText: 'example@gmail.com',
                              headingText: 'Email*',
                              validator: validateEmail,
                            ),
                            SizedBox(height: 15.h,),

                            FormInputWidget(
                              controller: passwordController,
                              hintText: '*********',
                              obscureText: true,
                              headingText: 'Password*',
                              validator: validatePassword,
                            ),
                            SizedBox(height: 15.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomCheckbox(
                                    value: _isChecked,
                                    onChanged: (newValue) {
                                      _isChecked = newValue;
                                    },
                                    title: 'Remember Login Info',
                                  ),
                                ),
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorsConstants.mainColor
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),

                            CustomButton(
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState!
                                    .validate()){
                                  _bloc.add(LoginUserEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                                }
                              },
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Don't Have An Account?",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsConstants.liteTextColor
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w,),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (context) => SignupPage()));
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsConstants.mainColor
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
