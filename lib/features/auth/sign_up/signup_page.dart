import 'package:flight_app/core/Widgets/custom_scaffold.dart';
import 'package:flight_app/core/constants/colors_constants.dart';
import 'package:flight_app/core/constants/image_constants.dart';
import 'package:flight_app/features/auth/login/login_page.dart';
import 'package:flight_app/features/auth/sign_up/data/data_source/signup_data_source.dart';
import 'package:flight_app/core/functions/validators.dart';
import 'package:flight_app/core/Widgets/custom_button.dart';
import 'package:flight_app/features/auth/widgets/custom_checkbox.dart';
import 'package:flight_app/features/auth/widgets/input_form_widget.dart';
import 'package:flight_app/features/auth/widgets/verify_code_dialog.dart';
import 'package:flight_app/features/flight_search/flight_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

import '../../../core/di/dependency_injection.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController emailController,
      passwordController,
      confirmPasswordController,
      nameController,
      phoneController;
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = true;

  late SignupBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    _bloc = SignupBloc(signupDataSource: sl<SignupDataSource>());

    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state.otpSuccess!) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FlightSearchPage()));
          } else if (state.isSuccess!) {
            verifyCodeDialog(
                context: context,
                onChanged: (pin) {
                  Navigator.pop(context);
                  _bloc.add(OtpSubmitEvent(otp: pin));
                });
          } else if (state.error!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.error ?? "");
            if (state.otpError!) {
              verifyCodeDialog(
                  context: context,
                  onChanged: (pin) {
                    Navigator.pop(context);
                    _bloc.add(OtpSubmitEvent(otp: pin));
                  });
            }
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading!,
              child: CustomScaffold(
                body: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: ColorsConstants.whiteColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ]),
                    margin: EdgeInsets.all(15.r),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              'Register For New User',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsConstants.mainColor),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            FormInputWidget(
                              controller: nameController,
                              hintText: 'full name',
                              headingText: 'Full Name*',
                              validator: validateName,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputWidget(
                              controller: emailController,
                              hintText: 'example@gmail.com',
                              headingText: 'Email*',
                              validator: validateEmail,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputWidget(
                              controller: phoneController,
                              hintText: '+9715********',
                              keyboardType: TextInputType.number,
                              headingText: 'Phone Number*',
                              validator: validatePhoneNumber,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputWidget(
                              controller: passwordController,
                              hintText: '*********',
                              obscureText: true,
                              headingText: 'Password*',
                              validator: validatePassword,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            FormInputWidget(
                              controller: confirmPasswordController,
                              hintText: '*********',
                              obscureText: true,
                              headingText: 'Confirm Password*',
                              validator: (value) {
                                return validateConfirmPassword(
                                    value, passwordController.text);
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomCheckbox(
                              value: _isChecked,
                              onChanged: (newValue) {
                                _isChecked = newValue;
                              },
                              title:
                                  'I Agree To The Terms Of Service And Privacy Policy',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                              text: 'Register',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_isChecked) {
                                    _bloc.add(RegisterUserEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        number: phoneController.text));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            'Privacy Policy Agreement required ');
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Already Have An Account?",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsConstants.liteTextColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsConstants.mainColor),
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
