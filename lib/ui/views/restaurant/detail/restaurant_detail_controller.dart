import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/core/helper/dialog_helper.dart';
import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/usecases/get_detail_restaurant.dart';

class RestaurantDetailController extends BaseController {
  final GetDetailRestaurant getDetailRestaurant;
  RestaurantDetailController({required this.getDetailRestaurant});

  String tag = 'RestaurantDetailController : ';

  final restaurant = Rxn<Restaurant>();

  @override
  void onInit() {
    restaurant.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() async {
    await loadData();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getDetailRestaurant(id: restaurant.value?.id ?? '').then((res) {
        hideLoading();
        restaurant.value = res;
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}