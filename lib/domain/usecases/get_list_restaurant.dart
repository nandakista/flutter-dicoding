import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/repositories/restaurant_repository.dart';

class GetListRestaurant {
  final RestaurantRepository repository;
  GetListRestaurant({required this.repository});

  Future<List<Restaurant>?> call() async {
    return await repository.getListRestaurant();
  }
}