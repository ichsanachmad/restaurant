import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/ui/detail_restaurant.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRestaurantsBloc(),
      child: _HomeScreenContainer(),
    );
  }
}

class _HomeScreenContainer extends StatefulWidget {
  @override
  __HomeScreenContainerState createState() => __HomeScreenContainerState();
}

class __HomeScreenContainerState extends State<_HomeScreenContainer> {
  @override
  void initState() {
    context.read<GetRestaurantsBloc>().add(OnRequestGetRestaurantsEvent());
    super.initState();
  }

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
            SizedBox(height: 20),
            BlocConsumer<GetRestaurantsBloc, GetRestaurantsState>(
              listener: (context, state) {
                if (state is OnErrorGetRestaurantsState) {
                  showSnackBar(context, message: 'Failed to Load Data');
                }
              },
              builder: (context, state) {
                if (state is OnSuccessGetRestaurantsState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.restaurants.length,
                    itemBuilder: (context, position) {
                      var restaurant = state.restaurants[position];
                      return _RestaurantListItem(
                        isFirst: position == 0,
                        isLast: position == state.restaurants.length - 1,
                        name: restaurant.name ?? "",
                        path: restaurant.pictureId ?? "",
                        location: restaurant.city ?? "",
                        rating: (restaurant.rating ?? "").toString(),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            DetailRestaurant.ROUTE,
                            arguments: restaurant,
                          );
                        },
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantListItem extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String name;
  final String path;
  final String location;
  final String rating;
  final VoidCallback onPressed;

  _RestaurantListItem({
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
