import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class SearchNotFoundRestaurantsData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Icon(Icons.close, size: 50, color: Colors.grey),
        Text(
          'Restaurant not found...',
          style: TextExtension.h1Style(textColor: Colors.grey),
        )
      ],
    );
  }
}