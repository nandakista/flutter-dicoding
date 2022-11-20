import 'package:skybase/data/models/food_drink_model.dart';
import 'package:skybase/domain/entities/restaurant/food_drink.dart';

class Menu {
  Menu({
    this.foods,
    this.drinks,
  });

  List<FoodDrink>? foods;
  List<FoodDrink>? drinks;
}
