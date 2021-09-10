import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/text_extension.dart';
import 'package:restaurant/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 48),
              child: Text(
                'Restaurant App',
                style: TextExtension.titleStyle(textColor: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 2),
              child: Text(
                'Here some recommended restaurants for you',
                style: TextExtension.h2Style(textColor: Colors.grey),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
                RestaurantListItem(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImageUtil.LOGO,
            height: 80,
            width: 80,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Restaurant name',
                style: TextExtension.h2Style(textColor: Colors.black),
              ),
              Text(
                'Location',
                style: TextExtension.normalStyle(textColor: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Rating',
                style: TextExtension.normalStyle(textColor: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
    );
  }
}
