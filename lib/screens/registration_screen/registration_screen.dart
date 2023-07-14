import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screen_models/controller/registration/registration_controller.dart';
import 'package:mvvm_clone/utils/utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
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
                  title: Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImageConstant.imgArrowleft,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Registration",
                          style: TextStyle(
                            color: AppColor.whiteA700,
                          )),
                    ],
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
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h, top: 10.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Form(
                              // key: controller.registration_form_key,
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Create an ",
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
                                height: 35.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
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
                                    style: TextStyle(color: AppColor.whiteA700),
                                    cursorColor: AppColor.whiteA700,
                                    controller:
                                        controller.email_controller.value,
                                    focusNode:
                                        controller.email_focus_node.value,
                                    onFieldSubmitted: (value) {
                                      Util.fieldFocusChange(
                                          context,
                                          controller.email_focus_node.value,
                                          controller.password_focus_node.value);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 15.h),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: AppColor.gray400),
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
                                  borderRadius: BorderRadius.circular(5.0),
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
                                    style: TextStyle(color: AppColor.whiteA700),
                                    cursorColor: AppColor.whiteA700,
                                    controller: controller.user_name.value,
                                    focusNode:
                                        controller.user_name_focus_node.value,
                                    onFieldSubmitted: (value) {
                                      Util.fieldFocusChange(
                                          context,
                                          controller.user_name_focus_node.value,
                                          controller.password_focus_node.value);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 15.h),
                                      border: InputBorder.none,
                                      hintText: "User Name",
                                      hintStyle:
                                          TextStyle(color: AppColor.gray400),
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
                                  borderRadius: BorderRadius.circular(5.0.r),
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
                                    style: TextStyle(color: AppColor.whiteA700),
                                    cursorColor: AppColor.whiteA700,
                                    controller:
                                        controller.password_controller.value,
                                    focusNode:
                                        controller.password_focus_node.value,
                                    onFieldSubmitted: (value) {
                                      Util.fieldFocusChange(
                                          context,
                                          controller.password_focus_node.value,
                                          controller.confirm_focus_node.value);
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
                                      hintStyle:
                                          TextStyle(color: AppColor.gray400),
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
                                  borderRadius: BorderRadius.circular(5.0),
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
                                    style: TextStyle(color: AppColor.whiteA700),
                                    cursorColor: AppColor.whiteA700,
                                    controller: controller
                                        .confirm_password_contrller.value,
                                    focusNode:
                                        controller.confirm_focus_node.value,
                                    onFieldSubmitted: (value) {
                                      Util.fieldFocusChange(
                                          context,
                                          controller.confirm_focus_node.value,
                                          controller.confirm_focus_node.value);
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 15.h),
                                        border: InputBorder.none,
                                        hintText: "Confirm Password",
                                        hintStyle:
                                            TextStyle(color: AppColor.gray400),
                                        labelStyle: TextStyle(
                                          color: AppColor.whiteA700,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: AppColor.gray400,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      activeColor: AppColor.whiteA700,
                                      checkColor: AppColor.teal900,
                                      side: BorderSide(
                                          color: AppColor.whiteA700,
                                          width: 2.r),
                                      value: controller
                                          .privacy_and_terms_accepted.value,
                                      onChanged: (val) {
                                        controller.privacy_and_terms_accepted
                                            .value = val!;
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "I have read & agree to the ",
                                            style: TextStyle(
                                                color: AppColor.whiteA700,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: "Terms of Use",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print("Hello");
                                              },
                                          ),
                                          TextSpan(
                                            text: " & ",
                                            style: TextStyle(
                                                color: AppColor.whiteA700,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: "Privacy Policy",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Do something when the "Privacy Policy" text is tapped.
                                              },
                                          ),
                                          TextSpan(
                                            text: ".",
                                            style: TextStyle(
                                                color: AppColor.whiteA700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                      controller.registrationApi();
                                    },
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Obx(() {
          //   switch (controller.request_status.value) {
          //     case Status.LOADING:
          //       return Container();
          //     case Status.COMPLETED:
          //       return Container(
          //         color: Colors.black.withOpacity(0.5),
          //         child: Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     case Status.ERROR:
          //       return Container(
          //         color: Colors.black.withOpacity(0.5),
          //         child: Center(
          //           child: Text(
          //             controller.error.value,
          //             style: TextStyle(color: Colors.amber),
          //           ),
          //         ),
          //       );
          //   }
          // }),
        ],
      ),
    );
  }
}
