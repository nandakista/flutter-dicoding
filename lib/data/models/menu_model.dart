import 'package:skybase/data/models/food_drink_model.dart';
import 'package:skybase/domain/entities/restaurant/food_drink.dart';
import 'package:skybase/domain/entities/restaurant/menu.dart';

class MenuModel extends Menu {
  MenuModel({
    List<FoodDrink>? drinks,
    List<FoodDrink>? foods,
  }) : super(
          drinks: drinks,
          foods: foods,
        );

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        foods: List<FoodDrink>.from(
            json["foods"].map((x) => FoodDrinkModel.fromJson(x))),
        drinks: List<FoodDrink>.from(
            json["drinks"].map((x) => FoodDrinkModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods,
        "drinks": drinks,
      };
}
