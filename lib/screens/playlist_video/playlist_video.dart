import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screen_models/controller/playlist_video/playlist_video_controller.dart';

class PlaylistVideo extends StatefulWidget {
  const PlaylistVideo({super.key});

  @override
  State<PlaylistVideo> createState() => _PlaylistVideoState();
}

class _PlaylistVideoState extends State<PlaylistVideo> {
  final controller = Get.put(PlayListVideoController());
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
                      Text("Playlist Videos",
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
                    return controller.playlist_video.length != 0
                        ? Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: controller.playlist_video.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // print(controller.playlist[index]['id']);
                                          // Get.toNamed(RoutesName.playlist_video,
                                          //     arguments: {
                                          //       "id": controller.playlist[index]
                                          //           ['id']
                                          //     });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 270.h,
                                          child: Image.network(
                                            "http://10.0.2.2:8000/${controller.playlist_video[index]["VideoThumbnail"]}",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: AppColor.black,
                                        height: 45.h,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20.w,
                                            ),

                                            Text(
                                              controller.playlist_video[index]
                                                  ["VideoTitle"],
                                              style: TextStyle(
                                                  color: AppColor.whiteA700,
                                                  fontSize: 25.sp),
                                            ),
                                            // Spacer(),
                                            // Text(
                                            //   "controller.home_controller.name.value",
                                            //   style: TextStyle(
                                            //       color: AppColor.whiteA700,
                                            //       fontSize: 25.sp),
                                            // ),
                                            SizedBox(
                                              width: 20.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.4),
                            child: Center(
                                child: Text(
                              "No Video Added",
                              style: TextStyle(
                                  color: AppColor.whiteA700, fontSize: 25.sp),
                            )),
                          );
                  case Status.ERROR:
                    return Center(
                      child: Text(controller.error.value),
                    );
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
