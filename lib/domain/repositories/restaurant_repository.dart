import 'package:skybase/domain/entities/restaurant/restaurant.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> getListRestaurant();
  Future<Restaurant> getDetailRestaurant({required String id});
  Future<List<Restaurant>> searchRestaurant({required String query});
}