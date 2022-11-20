import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/data/models/restaurant_model.dart';

class RestaurantDetailController extends BaseController {
  String tag = 'RestaurantDetailController : ';

  RestaurantModel? restaurant;

  @override
  void onInit() {
    restaurant = Get.arguments;
    super.onInit();
  }

}