import 'package:skybase/domain/entities/restaurant/menu.dart';

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.city,
    this.rating,
    this.menus,
  });

  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? city;
  double? rating;
  Menu? menus;
}
