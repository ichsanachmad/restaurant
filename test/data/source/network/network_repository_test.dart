import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/data/source/network/network_repository.dart';

import 'network_repository_test.mocks.dart';

@GenerateMocks([NetworkRepository])
main() async {
  var jsonFakeData = RestaurantResponse(
      restaurants: [Restaurant(id: 'asd', name: 'asd', description: 'asd')]);
  test('getRestaurants Success', () async {
    final NetworkRepository repo = MockNetworkRepository();

    when(repo.getRestaurants()).thenAnswer(
      (realInvocation) => Future.value(
        RestaurantResponse(
          restaurants: [Restaurant(id: 'asd', name: 'asd', description: 'asd')],
        ),
      ),
    );

    var res = await repo.getRestaurants();

    expect(res.restaurants?[0].id, jsonFakeData.restaurants?[0].id);
  });
}
