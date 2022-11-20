import 'package:skybase/data/models/menu_model.dart';
import 'package:skybase/domain/entities/restaurant/menu.dart';
import 'package:skybase/domain/entities/restaurant/restaurant.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? city,
    double? rating,
    Menu? menus,
  }) : super(
          id: id,
          name: name,
          description: description,
          city: city,
          rating: rating,
          imageUrl: imageUrl,
          menus: menus,
        );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["pictureId"],
        city: json["city"],
        rating: (json["rating"] != null) ? json["rating"].toDouble() : null,
        menus: (json["menus"] != null) ? MenuModel.fromJson(json["menus"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": imageUrl,
        "city": city,
        "rating": rating,
        "menus": menus,
      };
}
