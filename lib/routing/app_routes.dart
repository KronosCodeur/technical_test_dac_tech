import 'package:flutter/cupertino.dart';
import 'package:technical_test_dac_tech/screens/home_screen.dart';

class AppRouting{
  static Map<String,Widget Function(BuildContext)> routes ={
    "/home":(_)=>const HomeScreen(),
  };
}