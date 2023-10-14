import 'dart:io';

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
    return Container(
      width: Device.getScreenWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: Device.getDeviceScreenHeight(context, 10),
      decoration: BoxDecoration(
        borderRadius: AppRadius.radius10,
        color: AppColor.googleBlue,
      ),
      child: Row(
        children: [
          user.picture.contains("http")
              ? CircleAvatar(
            radius: Device.getDeviceScreenWidth(context, 10),
            backgroundImage: NetworkImage(user.picture),
          )
              : CircleAvatar(
            radius: Device.getDeviceScreenWidth(context, 10),
            backgroundImage: FileImage(File(user.picture)),
          ),
          Column(
            children: [
              Text(
                user.name,
                style: GoogleFonts.poppins(
                  fontSize: AppText.p1(context),
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
                softWrap: true,
                textAlign: TextAlign.start,
              ),
              Text(
                user.phone,
                style: GoogleFonts.poppins(
                  fontSize: AppText.p3(context),
                  fontWeight: FontWeight.w600,
                  color: AppColor.white70,
                ),
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ],
          )
        ],
      ),
    );
  }
}
