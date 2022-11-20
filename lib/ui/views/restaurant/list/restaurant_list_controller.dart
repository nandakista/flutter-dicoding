import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/data/models/restaurant_model.dart';

class RestaurantListController extends BaseController {
  String tag = 'HomeController : ';
  RxList<RestaurantModel> dataRestaurant = <RestaurantModel>[].obs;
  RxList<RestaurantModel> listRestaurant = <RestaurantModel>[].obs;

  @override
  onInit() {
    loadData().then((value) => dataRestaurant.addAll(listRestaurant));
    super.onInit();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await Future.delayed(const Duration(seconds: 1));
      final data = await getDataFromJsonFile();
      listRestaurant.addAll(List<RestaurantModel>.from(
        data.map((data) => RestaurantModel.fromJson(data)),
      ));
      hideLoading();
    } catch (e) {
      hideLoading();
      showError('$tag: Error = $e');
    }
  }

  localSearch(String? query) async {
    if (query == '' || query == null) {
      dataRestaurant.clear();
      dataRestaurant.addAll(listRestaurant);
    } else {
      dataRestaurant.clear();
      dataRestaurant.addAll(listRestaurant
          .where((e) =>
              e.name?.toLowerCase().contains(query.toLowerCase()) == true)
          .toList());
    }
  }
}

Future<dynamic> getDataFromJsonFile<T>() async {
  final response = await rootBundle.loadString('assets/jsons/restaurant.json');
  final data = await json.decode(response);
  return data['restaurants'];
}
