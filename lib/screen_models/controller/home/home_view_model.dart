import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:mvvm_clone/models/home/user_list_model.dart';
import 'package:mvvm_clone/repository/home_repository/home_repository.dart';

import '../../../data/response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final request_status = Status.LOADING.obs;
  final user_list = UserList().obs;
  RxString error = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;

  void setRequestStatus(Status _value) => request_status.value = _value;
  void setUserList(UserList _value) => user_list.value = _value;
  void setError(String _value) => error.value = _value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userProfileApi();
  }

  void userProfileApi() {
    _api.userProfileApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      name.value = value['name'];
      email.value = value['email'];
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }

  void playListApi() {
    _api.userListApi().then((value) {
      setRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
}
