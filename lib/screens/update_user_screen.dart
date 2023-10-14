import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/constants/genders.dart';
import 'package:technical_test_dac_tech/data/providers/user_provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/data/repositories/user_data_repository.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/radius_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/screen_size_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';
import 'package:technical_test_dac_tech/utils/input_decoration.dart';
import 'package:technical_test_dac_tech/utils/validator/date_regexp.dart';
import 'package:technical_test_dac_tech/utils/validator/email_regexp.dart';
import 'package:technical_test_dac_tech/utils/validator/phone_regexp.dart';
import 'package:technical_test_dac_tech/widgets/button/primary_button.dart';
import 'package:technical_test_dac_tech/widgets/button/secondary_button.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
        automaticallyImplyLeading: true,
      ),
      body: Consumer2<UserProvider, DataProvider>(
          builder: (context, userProvider, dataProvider, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        userProvider.picture.contains("http")?CircleAvatar(
                          radius: Device.getDeviceScreenWidth(context, 5),
                          backgroundColor: AppColor.black26,
                          backgroundImage:
                              NetworkImage(userProvider.picture),
                        ):CircleAvatar(
                          radius: Device.getDeviceScreenWidth(context, 5),
                          backgroundColor: AppColor.black26,
                          backgroundImage:
                              FileImage(File(userProvider.picture)),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: InkWell(
                            onTap: () async {
                              userProvider
                                  .setPicture(await UserRepository.getImage());
                            },
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: AppColor.googleRed,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 50)),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Last Name", context: context,radius: AppRadius.radius10),
                            keyboardType: TextInputType.name,
                            initialValue: userProvider.lastName,
                            onChanged: (value) =>
                                userProvider.setLastName(value),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                        Gap(Device.getDeviceScreenHeight(context, 90)),
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Last Name", context: context,radius: AppRadius.radius10),
                            initialValue: userProvider.firstName,
                            onChanged: (value) =>
                                userProvider.setFirstName(value),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                      ],
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    TextFormField(
                      decoration:
                          inputDecorationGrey(hint: "Email", context: context,radius: AppRadius.radius10),
                      initialValue: userProvider.email,
                      onChanged: (value) => userProvider.setEmail(value),
                      validator: (value) {
                        if (!emailIsValid(email: value!)) {
                          return "Invalid email address";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.poppins(
                          color: AppColor.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: AppText.p1(context)),
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    TextFormField(
                      decoration: inputDecorationGrey(
                          hint: "Phone Number", context: context,radius: AppRadius.radius10),
                      initialValue: userProvider.phone,
                      onChanged: (value) => userProvider.setPhone(value),
                      validator: (value) {
                        if (!phoneRegex(phone: value!)) {
                          return "Invalid phone Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                          color: AppColor.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: AppText.p1(context)),
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left:
                                      Device.getDeviceScreenWidth(context, 30)),
                              decoration: BoxDecoration(
                                  color: AppColor.black12,
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButton(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColor.googleRed,
                                  size: 30,
                                ),
                                dropdownColor: Colors.white,
                                focusColor: Colors.black,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                ),
                                underline: const SizedBox(),
                                isExpanded: true,
                                elevation: 25,
                                hint: Text(
                                  'Gender',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: AppText.p2(context)),
                                ),
                                value: userProvider.gender,
                                onChanged: (value) {
                                  userProvider.setGender(value!);
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: "Male",
                                    child: Text(
                                      "Male",
                                      style: GoogleFonts.poppins(
                                          color: AppColor.black87,
                                          fontWeight: FontWeight.w600,
                                          fontSize: AppText.p1(context)),
                                    ),
                                  ),DropdownMenuItem(
                                    value: "Female",
                                    child: Text(
                                      "Female",
                                      style: GoogleFonts.poppins(
                                          color: AppColor.black87,
                                          fontWeight: FontWeight.w600,
                                          fontSize: AppText.p1(context)),
                                    ),
                                  ),
                                ]
                              )),
                        ),
                        Gap(Device.getDeviceScreenHeight(context, 90)),
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Birthday", context: context,radius: AppRadius.radius10),
                            initialValue: userProvider.birthday,
                            onChanged: (value) =>
                                userProvider.setBirthday(value),
                            validator: (value) {
                              if (!dateIsValid(date: value!)) {
                                return "jj/mm/aaaa";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.datetime,
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                      ],
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Street", context: context,radius: AppRadius.radius10),
                            keyboardType: TextInputType.name,
                            initialValue: userProvider.street,
                            onChanged: (value) =>
                                userProvider.setStreet(value),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                        Gap(Device.getDeviceScreenHeight(context, 90)),
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "City", context: context,radius: AppRadius.radius10),
                            initialValue: userProvider.city,
                            onChanged: (value) =>
                                userProvider.setCity(value),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                      ],
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "State", context: context,radius: AppRadius.radius10),
                            initialValue: userProvider.state,
                            onChanged: (value) =>
                                userProvider.setState(value),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                        Gap(Device.getDeviceScreenHeight(context, 90)),
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Country", context: context,radius: AppRadius.radius10),
                            initialValue: userProvider.country,
                            onChanged: (value) =>
                                userProvider.setCountry(value),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is required";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            style: GoogleFonts.poppins(
                                color: AppColor.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: AppText.p1(context)),
                          ),
                        ),
                      ],
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SecondaryButton(
                            elevation: 2,
                            width: Device.getDeviceScreenWidth(context, 3),
                            height: Device.getDeviceScreenHeight(context, 20),
                            radius: AppRadius.radius10,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            borderWidth: 2,
                            borderColor: AppColor.black54,
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                  color: AppColor.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppText.p1(context)),
                            )),
                        PrimaryButton(
                            elevation: 2,
                            width: Device.getDeviceScreenWidth(context, 3),
                            height: Device.getDeviceScreenHeight(context, 20),
                            radius: AppRadius.radius10,
                            onPressed: () async{
                              userProvider.updateData();
                              dataProvider.updateUser(userProvider.user!);
                              userProvider.reset();
                              Navigator.pushReplacementNamed(context, "/root");
                            },
                            color: AppColor.googleRed,
                            child: Text(
                              "Update",
                              style: GoogleFonts.poppins(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppText.p1(context)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
