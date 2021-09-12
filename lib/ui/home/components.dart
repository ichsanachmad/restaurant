import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class TrioCircleDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -50,
          top: 20,
          child: _TrioCircleComponent(color: Colors.amber[100] ?? Colors.amber),
        ),
        Positioned(
          right: 50,
          top: -20,
          child: _TrioCircleComponent(color: Colors.blue[100] ?? Colors.blue),
        ),
        Positioned(
          right: 40,
          top: 70,
          child: _TrioCircleComponent(
            color: Colors.red[100] ?? Colors.red,
          ),
        ),
      ],
    );
  }
}

class _TrioCircleComponent extends StatelessWidget {
  final Color color;

  _TrioCircleComponent({required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 150,
        height: 150,
        color: color.withOpacity(0.5),
      ),
    );
  }
}

class LoadingLoadRestaurantsData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        CircularProgressIndicator(color: Colors.grey),
        Text(
          'Loading data...',
          style: TextExtension.h1Style(textColor: Colors.grey),
        )
      ],
    );
  }
}

class ErrorLoadRestaurantsData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Icon(Icons.warning, size: 50, color: Colors.grey),
        Text(
          'Failed to load data...',
          style: TextExtension.h1Style(textColor: Colors.grey),
        )
      ],
    );
  }
}
