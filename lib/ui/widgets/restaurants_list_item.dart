import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class RestaurantListItem extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String name;
  final String path;
  final String location;
  final String rating;
  final VoidCallback onPressed;

  RestaurantListItem({
    required this.isFirst,
    required this.isLast,
    required this.name,
    required this.path,
    required this.location,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: isFirst ? 8 : 4,
        bottom: isLast ? 8 : 4,
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                path,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextExtension.h2Style(textColor: Colors.black),
                ),
                Row(
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
                      location,
                      style: TextExtension.smallStyle(textColor: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextExtension.smallStyle(textColor: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
    );
  }
}