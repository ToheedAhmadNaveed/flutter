import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:mvvm_clone/models/home/user_list_model.dart';
import 'package:mvvm_clone/repository/home_repository/home_repository.dart';
import 'package:mvvm_clone/repository/playlist_repository/playlist_repository.dart';
import 'package:mvvm_clone/screen_models/controller/home/home_view_model.dart';

import '../../../data/response/status.dart';

class PlayListController extends GetxController {
  final _api = PlayListRepository();
  final request_status = Status.LOADING.obs;
  final user_list = UserList().obs;
  final home_controller = Get.find<HomeController>();
  RxString error = ''.obs;
  RxList playlist = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    playListApi();
  }

  void setRequestStatus(Status _value) => request_status.value = _value;
  void setUserList(UserList _value) => user_list.value = _value;
  void setError(String _value) => error.value = _value;

  void playListApi() {
    _api.userListApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      playlist.value = value;
      print("Hello World");
      print(playlist.value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
}
