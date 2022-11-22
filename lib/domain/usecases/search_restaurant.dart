import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/repositories/restaurant_repository.dart';

class SearchRestaurant {
  final RestaurantRepository repository;
  SearchRestaurant({required this.repository});

  Future<List<Restaurant>?> call({required String query}) async {
    return await repository.searchRestaurant(query: query);
  }
}