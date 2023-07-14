import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/screens/home_screen/home_screen.dart';
import 'package:mvvm_clone/screens/playlist_screen/playlist_screen.dart';

class BottomNavigation extends StatefulWidget {
  int index = 1;
  BottomNavigation({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _index;
  final screens = [
    const Home(),
    const PlaylistScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _index = widget.index; // initialize _counter with initialCount value
  }

  @override
  Widget build(BuildContext context) {
    final navBarHeight = Get.height * 0.063;
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(indicatorColor: Colors.transparent),
        child: NavigationBar(
            height: navBarHeight,
            backgroundColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _index,
            onDestinationSelected: (value) => setState(() {
                  _index = value;
                }),
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: AppColor.gray500,
                    size: 40.r,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                    color: AppColor.teal900,
                    size: 40.r,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.playlist_add,
                    color: AppColor.gray500,
                    size: 40.r,
                  ),
                  selectedIcon: Icon(
                    Icons.playlist_add,
                    color: AppColor.teal900,
                    size: 40.r,
                  ),
                  label: 'Playlist'),
            ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.005),
        child: screens[_index],
      ),
    );
  }
}
