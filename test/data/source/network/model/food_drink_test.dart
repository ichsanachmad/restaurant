import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';

main() {
  final jsonFakeData = Map<String, dynamic>();
  jsonFakeData['name'] = 'Food';

  final jsonString = jsonEncode(jsonFakeData);

  test('Test FoodDrink Parse To Json', () {
    FoodDrink foodDrink = FoodDrink(name: 'Food');

    var json = foodDrink.toJson();

    expect(jsonEncode(json), jsonString);
  });
}
