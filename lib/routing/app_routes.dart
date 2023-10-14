import 'package:flutter/cupertino.dart';
import 'package:technical_test_dac_tech/screens/add_user_screen.dart';
import 'package:technical_test_dac_tech/screens/favorite_screen.dart';
import 'package:technical_test_dac_tech/screens/home_screen.dart';
import 'package:technical_test_dac_tech/screens/root_app.dart';
import 'package:technical_test_dac_tech/screens/search_screen.dart';
import 'package:technical_test_dac_tech/screens/update_user_screen.dart';

class AppRouting {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/root": (_) => const RootApp(),
    "/add": (_) => const AddUserScreen(),
    "/update": (_) => const UpdateUserScreen(),
  };
  static List<Widget> listOfScreen = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];
}
