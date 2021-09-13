import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant/data/entity/restaurant_entity/restaurant_entity.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantResponse {
  List<Restaurant>? restaurants;

  RestaurantResponse({this.restaurants});

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}

@JsonSerializable()
class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menu? menus;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  factory Restaurant.fromRestaurantEntityJson(
          Map<String, dynamic> restaurantEntityJson) =>
      Restaurant.fromJson(restaurantEntityJson);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  RestaurantEntity toRestaurantEntity() => RestaurantEntity(
        this.id ?? "",
        jsonEncode(this),
      );
}

@JsonSerializable()
class Menu {
  List<FoodDrink>? foods;
  List<FoodDrink>? drinks;

  Menu({this.foods, this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable()
class FoodDrink {
  String? name;

  FoodDrink({this.name});

  factory FoodDrink.fromJson(Map<String, dynamic> json) =>
      _$FoodDrinkFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDrinkToJson(this);
}
