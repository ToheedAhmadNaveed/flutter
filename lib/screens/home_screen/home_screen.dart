import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screen_models/controller/home/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeController.playListApi();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: AppColor.teal900,
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
                    child: Text("Home",
                        style: TextStyle(
                            color: AppColor.whiteA700,
                            fontWeight: FontWeight.bold)),
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
                      left: 20.w,
                      right: 20.w,
                      bottom: 20.h,
                    ),
                    child: Column(
                      children: [Text("data")],
                    ),
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}

      // Obx(() {
      //   switch (homeController.request_status.value) {
      //     case Status.LOADING:
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     case Status.COMPLETED:
      //       return ListView.builder(
      //           itemCount: homeController.user_list.value.data!.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               child: ListTile(
      //                 title: Text(homeController
      //                     .user_list.value.data![index].email
      //                     .toString()),
      //               ),
      //             );
      //           });
      //     case Status.ERROR:
      //       return Center(
      //         child: Text(homeController.error.value),
      //       );
      //   }
      // }),