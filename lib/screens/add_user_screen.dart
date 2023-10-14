import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/constants/genders.dart';
import 'package:technical_test_dac_tech/data/providers/add_user_provider.dart';
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

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.googleRed,
        automaticallyImplyLeading: true,
      ),
      body: Consumer2<AddUserProvider, DataProvider>(
          builder: (context, addUserProvider, dataProvider, child) {
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
                        CircleAvatar(
                          radius: Device.getDeviceScreenWidth(context, 5),
                          backgroundColor: AppColor.black26,
                          backgroundImage:
                              FileImage(File(addUserProvider.picture)),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: InkWell(
                            onTap: () async {
                              addUserProvider
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
                                hint: "Last Name", context: context),
                            keyboardType: TextInputType.name,
                            initialValue: addUserProvider.lastName,
                            onChanged: (value) =>
                                addUserProvider.setLastName(value),
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
                                hint: "Last Name", context: context),
                            initialValue: addUserProvider.firstName,
                            onChanged: (value) =>
                                addUserProvider.setFirstName(value),
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
                          inputDecorationGrey(hint: "Email", context: context),
                      initialValue: addUserProvider.email,
                      onChanged: (value) => addUserProvider.setEmail(value),
                      validator: (value) {
                        if (!emailIsValid(email: value!)) {
                          return "Invalid email address";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.poppins(
                          color: AppColor.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: AppText.p1(context)),
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 90)),
                    TextFormField(
                      decoration: inputDecorationGrey(
                          hint: "Phone Number", context: context),
                      initialValue: addUserProvider.phone,
                      onChanged: (value) => addUserProvider.setPhone(value),
                      validator: (value) {
                        if (!phoneRegex(phone: value!)) {
                          return "Invalid phone Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                          color: AppColor.black54,
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
                                value: addUserProvider.gender,
                                onChanged: (value) {
                                  addUserProvider.setGender(value!);
                                },
                                items: genders.map((gender) {
                                  return DropdownMenuItem(
                                    value: gender,
                                    child: Text(
                                      gender,
                                      style: GoogleFonts.poppins(
                                          color: AppColor.black87,
                                          fontWeight: FontWeight.w600,
                                          fontSize: AppText.p1(context)),
                                    ),
                                  );
                                }).toList(),
                              )),
                        ),
                        Gap(Device.getDeviceScreenHeight(context, 90)),
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            decoration: inputDecorationGrey(
                                hint: "Birthday", context: context),
                            initialValue: addUserProvider.birthday,
                            onChanged: (value) =>
                                addUserProvider.setBirthday(value),
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
                                hint: "Street", context: context),
                            keyboardType: TextInputType.name,
                            initialValue: addUserProvider.street,
                            onChanged: (value) =>
                                addUserProvider.setStreet(value),
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
                                hint: "City", context: context),
                            initialValue: addUserProvider.city,
                            onChanged: (value) =>
                                addUserProvider.setCity(value),
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
                                hint: "State", context: context),
                            initialValue: addUserProvider.state,
                            onChanged: (value) =>
                                addUserProvider.setState(value),
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
                                hint: "Country", context: context),
                            initialValue: addUserProvider.country,
                            onChanged: (value) =>
                                addUserProvider.setCountry(value),
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
                              addUserProvider.setData();
                              dataProvider.addUser(addUserProvider.user!);
                              addUserProvider.reset();
                            },
                            color: AppColor.googleRed,
                            child: Text(
                              "Save",
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
