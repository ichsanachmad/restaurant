import 'package:json_annotation/json_annotation.dart';

part 'restaurant_entity.g.dart';

@JsonSerializable()
class RestaurantEntity {
  String id;
  String restaurantJson;

  RestaurantEntity(this.id, this.restaurantJson);

  factory RestaurantEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantEntityToJson(this);
}
