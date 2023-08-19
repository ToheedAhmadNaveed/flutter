import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/res/assets/image_constant.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screen_models/controller/video_player/video_player_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final controller = Get.put(PlayerController());
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    if (controller.request_status == Status.COMPLETED) {
      videoPlayerController = VideoPlayerController.network(
        'http://10.0.2.2:8000/${controller.data['Video']}', // Replace with your video URL
      );
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoInitialize: true,
        looping: true,
        autoPlay: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    chewieController?.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

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
                      Text(
                        "Video Player",
                        style: TextStyle(
                          color: AppColor.whiteA700,
                        ),
                      ),
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
                    return Expanded(
                      child: Chewie(
                        controller: chewieController!,
                      ),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(controller.error.value),
                    );
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
