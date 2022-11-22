import 'package:get/get.dart';
import 'package:skybase/data/repositories/restaurant_repository_impl.dart';
import 'package:skybase/data/sources/server/restaurant/restaurant_api_impl.dart';
import 'package:skybase/domain/usecases/get_list_restaurant.dart';
import 'package:skybase/domain/usecases/search_restaurant.dart';
import 'package:skybase/ui/views/restaurant/list/restaurant_list_controller.dart';

class RestaurantListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestaurantListController(
        getListRestaurant: GetListRestaurant(
          repository: RestaurantRepositoryImpl(
            apiService: RestaurantApiImpl(),
          ),
        ),
        searchRestaurant: SearchRestaurant(
          repository: RestaurantRepositoryImpl(
            apiService: RestaurantApiImpl(),
          ),
        ),
      ),
    );
  }
}
