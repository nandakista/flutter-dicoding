import 'package:get/get.dart';
import 'package:skybase/data/repositories/restaurant_repository_impl.dart';
import 'package:skybase/data/sources/server/restaurant/restaurant_api_impl.dart';
import 'package:skybase/domain/usecases/get_detail_restaurant.dart';
import 'package:skybase/ui/views/restaurant/detail/restaurant_detail_controller.dart';

class RestaurantDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestaurantDetailController(
        getDetailRestaurant: GetDetailRestaurant(
          repository: RestaurantRepositoryImpl(
            apiService: RestaurantApiImpl(),
          ),
        ),
      ),
    );
  }
}
