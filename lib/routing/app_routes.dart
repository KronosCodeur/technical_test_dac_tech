import 'package:flutter/cupertino.dart';
import 'package:technical_test_dac_tech/screens/favorite_screen.dart';
import 'package:technical_test_dac_tech/screens/home_screen.dart';
import 'package:technical_test_dac_tech/screens/root_app.dart';

class AppRouting{
  static Map<String,Widget Function(BuildContext)> routes ={
    "/root":(_)=>const RootApp(),
  };
  static List<Widget> listOfScreen = <Widget>[
    const HomeScreen(),
    const Text("Search"),
    const FavoriteScreen(),
  ];
}