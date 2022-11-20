import 'package:get/get.dart';
import 'package:skybase/ui/views/restaurant/list/restaurant_list_controller.dart';

class RestaurantListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestaurantListController());
  }
}