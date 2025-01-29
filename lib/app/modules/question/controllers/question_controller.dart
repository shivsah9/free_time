import 'package:free_time/app/core/config/result.dart';
import 'package:free_time/app/data/model/riddles_response/riddles_response/riddles_response.dart';
import 'package:free_time/app/data/repository/riddle_repo.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  //TODO: Implement QuestionController

  final count = 0.obs;

  var isHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getRiddlesResult();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  var riddlesResult = APIResult<RiddlesResponse>().obs;

  Future<void> getRiddlesResult() async {
    riddlesResult.value = APIResult.loading();
    var result = await RiddleRepo.getRiddles();

    if (result != null) {
      riddlesResult.value = APIResult.success(result);
    } else {
      riddlesResult.value = APIResult.error('Something went wrong');
    }

    if (riddlesResult.value.isSuccessful) {
    } else {
      Get.snackbar(
          'Error', riddlesResult.value.error ?? 'Something went wrong');
    }
  }
}
