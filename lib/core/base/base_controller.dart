import 'package:get/get.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxBool isError = false.obs;

  showLoading() {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
  }
  hideLoading() => isLoading.value = false;

  showError(String message) {
    errorMessage.value = message;
    isError.value = true;
  }
}
