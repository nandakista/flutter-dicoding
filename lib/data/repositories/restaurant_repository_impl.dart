import 'package:skybase/data/sources/server/restaurant/restaurant_api.dart';
import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository{
  final RestaurantApi apiService;
  RestaurantRepositoryImpl({required this.apiService});

  String tag = 'Restaurant Repository';

  @override
  Future<Restaurant> getDetailRestaurant({required String id}) async {
    return await apiService.getDetailRestaurant(id: id);
  }

  @override
  Future<List<Restaurant>> getListRestaurant() async {
    return await apiService.getListRestaurant();
  }

  @override
  Future<List<Restaurant>> searchRestaurant({required String query}) async {
    return await apiService.searchRestaurant(query: query);
  }
}