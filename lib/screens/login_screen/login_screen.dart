import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/res/routes/routes_name.dart';
import 'package:mvvm_clone/utils/utils.dart';
import 'package:mvvm_clone/screen_models/controller/login/login_screen_model.dart';

import '../../res/assets/image_constant.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final login_controller = Get.put(LoginScreenController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imageFullVector1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: AppBar(
                    title: Center(
                      child: Text("Login",
                          style: TextStyle(
                            color: AppColor.whiteA700,
                          )),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Login to your ",
                                    style: TextStyle(
                                        color: AppColor.whiteA700,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "Account",
                                    style: TextStyle(
                                        color: AppColor.yellowA200,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: AppColor
                                              .whiteA700, // set the border color
                                          width: 1, // set the border width
                                        ),
                                      ),
                                      width: double.infinity,
                                      height: Util.text_field_height,
                                      child: Center(
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: AppColor.whiteA700),
                                          controller: login_controller
                                              .email_controller.value,
                                          focusNode: login_controller
                                              .email_focus_node.value,
                                          onFieldSubmitted: (value) {
                                            Util.fieldFocusChange(
                                                context,
                                                login_controller
                                                    .email_focus_node.value,
                                                login_controller
                                                    .password_focus_node.value);
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 15.h),
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: AppColor.gray400),
                                            prefixIcon: Icon(
                                              Icons.mail,
                                              color: AppColor.gray400,
                                            ),
                                            labelStyle: TextStyle(
                                              color: AppColor.whiteA700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: AppColor
                                              .whiteA700, // set the border color
                                          width: 1, // set the border width
                                        ),
                                      ),
                                      width: double.infinity,
                                      height: Util.text_field_height,
                                      child: Center(
                                        child: TextFormField(
                                          obscureText: true,
                                          style: TextStyle(
                                              color: AppColor.whiteA700),
                                          controller: login_controller
                                              .password_controller.value,
                                          focusNode: login_controller
                                              .password_focus_node.value,
                                          onFieldSubmitted: (value) {
                                            Util.fieldFocusChange(
                                                context,
                                                login_controller
                                                    .password_focus_node.value,
                                                login_controller
                                                    .password_focus_node.value);
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(top: 15.h),
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: AppColor.gray400,
                                            ),
                                            hintStyle: TextStyle(
                                                color: AppColor.gray400),
                                            labelStyle: TextStyle(
                                              color: AppColor.whiteA700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: Util.button_height,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.whiteA700),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  login_controller.loginApi();
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(RoutesName.registration_screen,
                                //     arguments: {"isScreen": "registration"});
                              },
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have account? ",
                                        style: TextStyle(
                                            color: AppColor.whiteA700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "Register",
                                        style: TextStyle(
                                            color: AppColor.yellowA200,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Obx(() {
              switch (login_controller.request_status.value) {
                case Status.LOADING:
                  return Container();
                case Status.COMPLETED:
                  return Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case Status.ERROR:
                  return Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        "error",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  );
              }
            }),
          ],
        ),
      ),
    );
  }
}
