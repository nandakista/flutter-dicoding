import 'package:get/get.dart';
import 'package:skybase/ui/views/restaurant/list/restaurant_list_binding.dart';
import 'package:skybase/ui/views/restaurant/list/restaurant_list_view.dart';

final restaurantListRoute = [
  GetPage(
    name: RestaurantListView.route,
    page: () => const RestaurantListView(),
    binding: RestaurantListBinding(),
  ),
];
