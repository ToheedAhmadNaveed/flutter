import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
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
                                  text: "WELCOME ",
                                  style: TextStyle(
                                      color: AppColor.whiteA700,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "User Name",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
