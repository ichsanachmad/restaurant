import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/ui/search/components.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/ui/home/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class SearchScreen extends StatelessWidget {
  static const ROUTE = "/searchRestaurants";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRestaurantsBloc(),
      child: _SearchScreenContainer(),
    );
  }
}

class _SearchScreenContainer extends StatefulWidget {
  @override
  __SearchScreenContainerState createState() => __SearchScreenContainerState();
}

class __SearchScreenContainerState extends State<_SearchScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            TrioCircleDecoration(),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, top: 64),
                  child: Text(
                    'Search Restaurant',
                    style: TextExtension.titleStyle(textColor: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: Text(
                    'Search your favorite restaurant',
                    style: TextExtension.h2Style(textColor: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Name',
                      hintStyle: TextExtension.normalStyle(
                        textColor: Colors.grey,
                      ),
                    ),
                    onSubmitted: (value) {
                      context.read<GetRestaurantsBloc>().add(
                            OnSearchRestaurantsEvent(
                              query: value,
                            ),
                          );
                    },
                  ),
                ),
                SizedBox(height: 20),
                BlocConsumer<GetRestaurantsBloc, GetRestaurantsState>(
                  listener: (context, state) {
                    if (state is OnErrorGetRestaurantsState) {
                      showSnackBar(context,
                          message: 'Terjadi kesalahan koneksi');
                    }
                  },
                  builder: (context, state) {
                    if (state is GetRestaurantsInitState) {
                      return Container();
                    }

                    if (state is OnLoadingGetRestaurantsState) {
                      return LoadingLoadRestaurantsData();
                    }

                    if (state is OnSuccessGetRestaurantsState) {
                      if (state.restaurants.isEmpty)
                        return SearchNotFoundRestaurantsData();

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
