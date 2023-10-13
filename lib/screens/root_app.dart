import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_dac_tech/controllers/api_data_controller.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/routing/app_routes.dart';
import 'package:technical_test_dac_tech/screens/home_screen.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/share_preference_helper.dart';
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
    _getData();
  }

  _getData() async {
    var isNew = await SharedPreferencesHelper.getBoolValue("is_New_User");
    if (isNew != null) {
      setState(() {
        isNewClient = isNew;
      });
    }
    if (isNewClient) {
      List<User> apiData = await APIDataController.getApiData();
      for (var item in apiData) {
        await DatabaseHelper().insert("users", item.toJson());
      }
      await SharedPreferencesHelper.setBoolValue("is_New_User", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
