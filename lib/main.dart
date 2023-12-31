import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/providers/user_provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/data/providers/search_provider.dart';
import 'package:technical_test_dac_tech/routing/app_routes.dart';
import 'package:technical_test_dac_tech/themes/app_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouting.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: "/root",
      theme: AppTheme.lightTheme(context: context)
    );
  }
}
