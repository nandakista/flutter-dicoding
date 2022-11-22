import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/usecases/get_list_restaurant.dart';
import 'package:skybase/domain/usecases/search_restaurant.dart';

class RestaurantListController extends BaseController {
  final GetListRestaurant getListRestaurant;
  final SearchRestaurant searchRestaurant;

  RestaurantListController({
    required this.getListRestaurant,
    required this.searchRestaurant,
  });

  String tag = 'HomeController : ';
  RxList<Restaurant> dataRestaurant = <Restaurant>[].obs;
  RxList<Restaurant> listRestaurant = <Restaurant>[].obs;

  @override
  onInit() {
    loadData().then((value) => dataRestaurant.addAll(listRestaurant));
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getListRestaurant().then((data) {
        listRestaurant.addAll(data ?? []);
      });
      hideLoading();
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }

  Future<void> searchData(String? query) async {
    try {
      showLoading();
      if(query == null || query == '') {
        dataRestaurant.clear();
        dataRestaurant.addAll(listRestaurant);
      } else {
        await searchRestaurant(query: query.toString()).then((data) {
          dataRestaurant.clear();
          dataRestaurant.addAll(data ?? []);
        });
      }
      hideLoading();
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
