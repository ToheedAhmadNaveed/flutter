import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screen_models/controller/playlist/playlist_controller.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final controller = Get.put(PlayListController());
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              children: [
                Container(
                  child: AppBar(
                    title: Center(
                      child: Text("PlayList",
                          style: TextStyle(
                              color: AppColor.whiteA700,
                              fontWeight: FontWeight.bold)),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                  ),
                ),
                Obx(() {
                  switch (controller.request_status.value) {
                    case Status.LOADING:
                      return Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.4),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case Status.COMPLETED:
                      return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.playlist.length,
                            itemBuilder: (context, index) {
                              return Text("data");
                            }),
                      );
                    case Status.ERROR:
                      return Center(
                        child: Text(controller.error.value),
                      );
                  }
                }),
              ],
            ),
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