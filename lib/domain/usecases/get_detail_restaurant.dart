import 'package:skybase/domain/entities/restaurant/restaurant.dart';
import 'package:skybase/domain/repositories/restaurant_repository.dart';

class GetDetailRestaurant {
  final RestaurantRepository repository;
  GetDetailRestaurant({required this.repository});

  Future<Restaurant?> call({required String id}) async {
    return await repository.getDetailRestaurant(id: id);
  }
}