import 'package:flutter/material.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/ui/widgets/text_extension.dart';
import 'package:restaurant/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  static const ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return SplashScreenContainer();
  }
}

class SplashScreenContainer extends StatefulWidget {
  @override
  _SplashScreenContainerState createState() => _SplashScreenContainerState();
}

class _SplashScreenContainerState extends State<SplashScreenContainer> {
  Future<void> _onNavigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.popAndPushNamed(context, HomeScreen.ROUTE);
  }

  @override
  void initState() {
    super.initState();
    _onNavigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageUtil.LOGO,
                height: 150,
                width: 150,
              ),
              SizedBox(height: 10),
              Text(
                'Restaurant App',
                style: TextExtension.h1Style(textColor: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
