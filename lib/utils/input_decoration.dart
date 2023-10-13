import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';

inputDecorationGrey({required hint,required context}) {
  return InputDecoration(
    filled: true,
    fillColor: AppColor.black12,
    hintText: '$hint',
    hintStyle:GoogleFonts.poppins(
      color: AppColor.black54,
      fontWeight: FontWeight.w600,
      fontSize: AppText.p2(context)
    ),
    contentPadding: const EdgeInsets.all(15),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.googleRed.withOpacity(0.7),width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}