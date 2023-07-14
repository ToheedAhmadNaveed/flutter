import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
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
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Obx(() {
        switch (homeController.request_status.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.user_list.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(homeController
                          .user_list.value.data![index].email
                          .toString()),
                    ),
                  );
                });
          case Status.ERROR:
            return Center(
              child: Text(homeController.error.value),
            );
        }
      }),
    );
  }
}
