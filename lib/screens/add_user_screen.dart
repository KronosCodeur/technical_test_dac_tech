import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/screen_size_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';
import 'package:technical_test_dac_tech/utils/input_decoration.dart';
class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: inputDecorationGrey(hint: "First Name",context: context),
                  style: GoogleFonts.poppins(
                      color: AppColor.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: AppText.p1(context)
                  ),
                ),
                  Gap(Device.getDeviceScreenHeight(context, 90)),
                TextFormField(
                  decoration: inputDecorationGrey(hint: "First Name",context: context),
                  style: GoogleFonts.poppins(
                      color: AppColor.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: AppText.p1(context)
                  ),
                ),
                  Gap(Device.getDeviceScreenHeight(context, 90)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
