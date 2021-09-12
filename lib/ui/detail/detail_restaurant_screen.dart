import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/ui/detail/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class DetailRestaurantScreen extends StatelessWidget {
  static const ROUTE = '/detailRestaurant';

  final Restaurant restaurant;

  DetailRestaurantScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  restaurant.pictureId ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                restaurant.name ?? "",
                style: TextExtension.h1Style(
                  textColor: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text(
                    restaurant.city ?? "",
                    style: TextExtension.normalStyle(textColor: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Description",
                style: TextExtension.h2Style(
                  textColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                restaurant.description ?? "",
                style: TextExtension.normalStyle(
                  textColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Foods",
                style: TextExtension.h2Style(
                  textColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.menus?.foods?.length ?? 0,
                itemBuilder: (context, position) {
                  var food = restaurant.menus?.foods?[position].name;
                  return FoodDrinkListItem(
                    isFirst: position == 0,
                    isLast: position == restaurant.menus?.foods?.length,
                    name: food ?? "",
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Drinks",
                style: TextExtension.h2Style(
                  textColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.menus?.drinks?.length ?? 0,
                itemBuilder: (context, position) {
                  var drink = restaurant.menus?.drinks?[position].name;
                  return FoodDrinkListItem(
                    isFirst: position == 0,
                    isLast:
                        position == (restaurant.menus?.drinks?.length ?? 1) - 1,
                    name: drink ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
