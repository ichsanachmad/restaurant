import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/ui/detail/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class DetailRestaurantScreen extends StatelessWidget {
  static const ROUTE = '/detailRestaurant';

  final Restaurant restaurant;

  DetailRestaurantScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetRestaurantsBloc>(
            create: (context) => GetRestaurantsBloc()),
        BlocProvider<InsertRestaurantLocalBloc>(
            create: (context) => InsertRestaurantLocalBloc()),
        BlocProvider<DeleteRestaurantLocalBloc>(
            create: (context) => DeleteRestaurantLocalBloc()),
      ],
      child: DetailRestaurantContainer(restaurant: this.restaurant),
    );
  }
}

class DetailRestaurantContainer extends StatefulWidget {
  final Restaurant restaurant;

  DetailRestaurantContainer({required this.restaurant});

  @override
  State<DetailRestaurantContainer> createState() =>
      _DetailRestaurantContainerState();
}

class _DetailRestaurantContainerState extends State<DetailRestaurantContainer> {
  var _isExist = false;
  @override
  void initState() {
    context.read<GetRestaurantsBloc>().add(
        OnCheckRestaurantLocalIsExistEvent(id: widget.restaurant.id ?? ""));
    super.initState();
  }

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
                  widget.restaurant.pictureId ?? "",
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
                widget.restaurant.name ?? "",
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
                    widget.restaurant.city ?? "",
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
                widget.restaurant.description ?? "",
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
                itemCount: widget.restaurant.menus?.foods?.length ?? 0,
                itemBuilder: (context, position) {
                  var food = widget.restaurant.menus?.foods?[position].name;
                  return FoodDrinkListItem(
                    isFirst: position == 0,
                    isLast: position == widget.restaurant.menus?.foods?.length,
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
                itemCount: widget.restaurant.menus?.drinks?.length ?? 0,
                itemBuilder: (context, position) {
                  var drink = widget.restaurant.menus?.drinks?[position].name;
                  return FoodDrinkListItem(
                    isFirst: position == 0,
                    isLast: position ==
                        (widget.restaurant.menus?.drinks?.length ?? 1) - 1,
                    name: drink ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocBuilder<GetRestaurantsBloc, GetRestaurantsState>(
        builder: (context, state) {
          if (state is OnSuccessCheckRestaurantLocalIsExistState) {
            _isExist = state.isExist;
          }
          return FloatingActionButton(
            child: Icon(_isExist ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              if (_isExist) {
                context.read<DeleteRestaurantLocalBloc>().add(
                    DeleteRestaurantLocalEvent(id: widget.restaurant.id ?? ""));
                showSnackBar(context, message: "Deleted from Favorite");
              } else {
                context.read<InsertRestaurantLocalBloc>().add(
                    InsertRestaurantLocalEvent(restaurant: widget.restaurant));
                showSnackBar(context, message: "Added to Favorite");
              }

              context.read<GetRestaurantsBloc>().add(
                  OnCheckRestaurantLocalIsExistEvent(
                      id: widget.restaurant.id ?? ""));

              setState(() => _isExist = !_isExist);
            },
          );
        },
      ),
    );
  }
}
