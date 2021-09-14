import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/ui/setting/setting_screen.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/ui/home/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';
import 'package:restaurant/utils/utils.dart';

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
  final NotificationHelper _helper = NotificationHelper();

  @override
  void initState() {
    context.read<GetRestaurantsBloc>().add(OnRequestGetRestaurantsEvent());
    super.initState();
    _helper.configureSelectNotificationSubject(SettingScreen.ROUTE);
  }

  @override
  void dispose() {

    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TrioCircleDecoration(),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 56, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, FavoriteScreen.ROUTE);
                        },
                      ),
                      SizedBox(width: 16),
                      CustomIconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SearchScreen.ROUTE);
                        },
                      ),
                      SizedBox(width: 24),
                      CustomIconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SettingScreen.ROUTE);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16),
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
                      showSnackBar(context, message: 'Connection error');
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
