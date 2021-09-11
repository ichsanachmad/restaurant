import 'package:flutter/material.dart';

class FoodDrinkListItem extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String name;

  FoodDrinkListItem({
    required this.isFirst,
    required this.isLast,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(
        left: isFirst ? 16 : 4,
        right: isLast ? 16 : 4,
        top: 8,
        bottom: 8,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.restaurant_menu, size: 50),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
