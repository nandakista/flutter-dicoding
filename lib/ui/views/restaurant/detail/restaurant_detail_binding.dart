import 'package:get/get.dart';
import 'package:skybase/ui/views/restaurant/detail/restaurant_detail_controller.dart';

class RestaurantDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestaurantDetailController());
  }
}