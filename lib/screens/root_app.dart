import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical_test_dac_tech/routing/app_routes.dart';
import 'package:technical_test_dac_tech/screens/home_screen.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
        elevation: 0,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child:AppRouting.listOfScreen[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.googleRed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon:  FaIcon(FontAwesomeIcons.home,color: AppColor.black54,),
              label: "",
              activeIcon: FaIcon(
                FontAwesomeIcons.home,
                color: AppColor.white,
              )), BottomNavigationBarItem(
              icon:  FaIcon(FontAwesomeIcons.searchengin,color: AppColor.black54,),
              label: "",
              activeIcon: FaIcon(
                FontAwesomeIcons.searchengin,
                color: AppColor.white,
              )),
          BottomNavigationBarItem(
              icon:  FaIcon(FontAwesomeIcons.solidHeart,color: AppColor.black54,),
              label: "",
              activeIcon: FaIcon(
                FontAwesomeIcons.solidHeart,
                color: AppColor.white,
              )),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),

    );
  }
}
