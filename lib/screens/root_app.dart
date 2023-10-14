import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/routing/app_routes.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 0;
  bool isNewClient = true;
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).setUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: AppRouting.listOfScreen[currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.googleRed,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: AppText.p1(context),
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        showUnselectedLabels: false,
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: AppText.p2(context),
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
        selectedItemColor: AppColor.white,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: AppColor.black54,
                size: 35,
              ),
              label: "Home",
              activeIcon: FaIcon(
                FontAwesomeIcons.home,
                color: AppColor.white,
                size: 35,
              )),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.searchengin,
                color: AppColor.black54,
                size: 30,
              ),
              label: "Search",
              activeIcon: FaIcon(
                FontAwesomeIcons.searchengin,
                color: AppColor.white,
                size: 35,
              )),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidHeart,
                color: AppColor.black54,
                size: 30,
              ),
              label: "Favorites",
              activeIcon: FaIcon(
                FontAwesomeIcons.solidHeart,
                color: AppColor.white,
                size: 35,
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
