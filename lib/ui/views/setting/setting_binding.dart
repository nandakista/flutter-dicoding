import 'package:get/get.dart';
import 'package:skybase/ui/views/setting/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}