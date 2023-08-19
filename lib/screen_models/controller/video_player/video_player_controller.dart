import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/repository/video_player_repository/video_player_repository.dart';

class PlayerController extends GetxController {
  final _api = VideoPlayerRepository();
  final request_status = Status.LOADING.obs;
  final arguments = Get.arguments;
  RxString error = ''.obs;
  var data;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(arguments);
    videoPlayApi();
  }

  void setRequestStatus(Status _value) => request_status.value = _value;
  void setError(String _value) => error.value = _value;

  void videoPlayApi() {
    _api.videoPlayerApi(arguments['id'].toString()).then((value) {
      setRequestStatus(Status.COMPLETED);
      data = value;
      print("object");
      print(data['Video']);
      // playlist_video.value = value;
      print("value $value");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);
    });
  }
}
