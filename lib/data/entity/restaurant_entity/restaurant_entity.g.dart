// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantEntity _$RestaurantEntityFromJson(Map<String, dynamic> json) {
  return RestaurantEntity(
    json['id'] as String,
    json['restaurantJson'] as String,
  );
}

Map<String, dynamic> _$RestaurantEntityToJson(RestaurantEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantJson': instance.restaurantJson,
    };
