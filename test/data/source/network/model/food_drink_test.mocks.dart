// Mocks generated by Mockito 5.0.15 from annotations
// in restaurant/test/data/source/network/model/food_drink_test.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:restaurant/data/model/restaurant/restaurant_model.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [FoodDrink].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodDrink extends _i1.Mock implements _i2.FoodDrink {
  MockFoodDrink() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set name(String? _name) => super.noSuchMethod(Invocation.setter(#name, _name),
      returnValueForMissingStub: null);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  String toString() => super.toString();
}
