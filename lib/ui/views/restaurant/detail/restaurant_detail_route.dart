import 'package:get/get.dart';
import 'package:skybase/ui/views/restaurant/detail/restaurant_detail_binding.dart';
import 'package:skybase/ui/views/restaurant/detail/restaurant_detail_view.dart';

final restaurantDetailRoute = [
  GetPage(
    name: RestaurantDetailView.route,
    page: () => const RestaurantDetailView(),
    binding: RestaurantDetailBinding(),
  ),
];
