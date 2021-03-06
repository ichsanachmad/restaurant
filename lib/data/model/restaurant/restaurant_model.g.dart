// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) {
  return RestaurantResponse(
    restaurants: (json['restaurants'] as List<dynamic>?)
        ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    pictureId: json['pictureId'] as String?,
    city: json['city'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    menus: json['menus'] == null
        ? null
        : Menu.fromJson(json['menus'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'rating': instance.rating,
      'menus': instance.menus,
    };

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    foods: (json['foods'] as List<dynamic>?)
        ?.map((e) => FoodDrink.fromJson(e as Map<String, dynamic>))
        .toList(),
    drinks: (json['drinks'] as List<dynamic>?)
        ?.map((e) => FoodDrink.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };

FoodDrink _$FoodDrinkFromJson(Map<String, dynamic> json) {
  return FoodDrink(
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$FoodDrinkToJson(FoodDrink instance) => <String, dynamic>{
      'name': instance.name,
    };
