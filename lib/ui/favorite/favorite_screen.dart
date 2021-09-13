import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/ui/home/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class FavoriteScreen extends StatelessWidget {
  static const ROUTE = '/favorite';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRestaurantsBloc(),
      child: _FavoriteScreenContainer(),
    );
  }
}

class _FavoriteScreenContainer extends StatefulWidget {
  @override
  __FavoriteScreenContainerState createState() =>
      __FavoriteScreenContainerState();
}

class __FavoriteScreenContainerState extends State<_FavoriteScreenContainer> {
  @override
  void initState() {
    context.read<GetRestaurantsBloc>().add(OnGetRestaurantsLocalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            TrioCircleDecoration(),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, top: 64),
                  child: Text(
                    'Favorite Restaurant',
                    style: TextExtension.titleStyle(textColor: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: Text(
                    'Here some favorite restaurants that you like',
                    style: TextExtension.h2Style(textColor: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                BlocConsumer<GetRestaurantsBloc, GetRestaurantsState>(
                  listener: (context, state) {
                    if (state is OnErrorGetRestaurantsState) {
                      showSnackBar(context, message: 'Error');
                    }
                  },
                  builder: (context, state) {
                    if (state is OnLoadingGetRestaurantsState) {
                      return LoadingLoadRestaurantsData();
                    }

                    if (state is OnSuccessGetRestaurantsState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, position) {
                          var restaurant = state.restaurants[position];
                          return RestaurantListItem(
                            isFirst: position == 0,
                            isLast: position == state.restaurants.length - 1,
                            name: restaurant.name ?? "",
                            path: restaurant.pictureId ?? "",
                            location: restaurant.city ?? "",
                            rating: (restaurant.rating ?? "").toString(),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                DetailRestaurantScreen.ROUTE,
                                arguments: restaurant,
                              );
                            },
                          );
                        },
                      );
                    }
                    return ErrorLoadRestaurantsData();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
