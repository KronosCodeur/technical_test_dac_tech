import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/routing/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouting.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
    );
  }
}
