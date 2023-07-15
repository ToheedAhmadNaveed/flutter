import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/repository/playlist_video_repository/playlist_video_repository.dart';

class PlayListVideoController extends GetxController {
  final _api = PlayListVideoRepository();
  final request_status = Status.LOADING.obs;
  final arguments = Get.arguments;
  RxString error = ''.obs;
  RxList playlist_video = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    playListVideoApi();
  }

  void setRequestStatus(Status _value) => request_status.value = _value;
  void setError(String _value) => error.value = _value;

  void playListVideoApi() {
    _api.playListVideoApi(arguments['id'].toString()).then((value) {
      setRequestStatus(Status.COMPLETED);
      playlist_video.value = value;
      print("value $value");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
}
