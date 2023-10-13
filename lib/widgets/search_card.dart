import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/radius_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/screen_size_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppRadius.radius20,
      child: Container(
        width: Device.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: Device.getDeviceScreenHeight(context, 18),
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius20,
          color: AppColor.googleBlue,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.picture),
            )
          ],
        ),
      ),
    );
  }
}
