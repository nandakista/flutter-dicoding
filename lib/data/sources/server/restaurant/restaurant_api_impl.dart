import 'package:flutter/foundation.dart';
import 'package:skybase/core/network/api_request.dart';
import 'package:skybase/data/models/restaurant_model.dart';
import 'package:skybase/data/sources/server/restaurant/restaurant_api.dart';
import 'package:skybase/domain/entities/restaurant/restaurant.dart';

class RestaurantApiImpl implements RestaurantApi {
  String tag = 'Restaurant Api';

  @override
  Future<Restaurant> getDetailRestaurant({required String id}) async {
    try {
      final _res = await sendRequest(
        url: '/detail/$id',
        requestMethod: RequestMethod.GET,
      );
      return RestaurantModel.fromJson(_res.data['restaurant']);
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<List<Restaurant>> getListRestaurant() async {
    try {
      final _res = await sendRequest(
        url: '/list',
        requestMethod: RequestMethod.GET,
      );
      return List<Restaurant>.from(
        _res.data['restaurants'].map(
          (data) => RestaurantModel.fromJson(data),
        ),
      );
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }

  @override
  Future<List<Restaurant>> searchRestaurant({required String query}) async {
    try {
      final _res = await sendRequest(
        url: '/search?q=$query',
        requestMethod: RequestMethod.GET,
      );
      return List<Restaurant>.from(
        _res.data['restaurants'].map(
              (data) => RestaurantModel.fromJson(data),
        ),
      );
    } catch (e) {
      debugPrint('$tag Error = $e');
      rethrow;
    }
  }
}
