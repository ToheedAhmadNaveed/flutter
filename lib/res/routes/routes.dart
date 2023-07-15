import 'package:get/route_manager.dart';
import 'package:mvvm_clone/res/routes/routes_name.dart';
import 'package:mvvm_clone/screens/home_screen/home_screen.dart';
import 'package:mvvm_clone/screens/login_screen/login_screen.dart';
import 'package:mvvm_clone/screens/playlist_video/playlist_video.dart';
import 'package:mvvm_clone/screens/registration_screen/registration_screen.dart';
import 'package:mvvm_clone/screens/splash_screen.dart';
import 'package:mvvm_clone/screens/user_name_screen/user_name_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash_screen,
          page: () => SplashScreen(),
          // transition: Transition.circularReveal
        ),
        GetPage(
          name: RoutesName.login_screen,
          page: () => Login_Screen(),
          // transition: Transition.circularReveal
        ),
        GetPage(
          name: RoutesName.home_screen,
          page: () => Home(),
        ),
        GetPage(
          name: RoutesName.registration_screen,
          page: () => RegistrationScreen(),
        ),
        GetPage(
          name: RoutesName.user_name_screen,
          page: () => UserNameScreen(),
        ),
        GetPage(
          name: RoutesName.playlist_video,
          page: () => PlaylistVideo(),
        ),
      ];
}
