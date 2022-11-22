import 'package:skybase/domain/entities/restaurant/menu.dart';
import 'package:skybase/domain/entities/restaurant/restaurant_category.dart';
import 'package:skybase/domain/entities/restaurant/customer_review.dart';

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
    this.categories,
    this.customerReviews,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menu? menus;
  List<RestaurantCategory>? categories;
  List<CustomerReview>? customerReviews;
}
