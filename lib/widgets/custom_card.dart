import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/data/providers/user_provider.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/radius_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/screen_size_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';
import 'package:technical_test_dac_tech/widgets/button/primary_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppRadius.radius20,
      child: Container(
        width: Device.getScreenWidth(context) * 0.25,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: Device.getScreenHeight(context) * 0.4,
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius20,
          color: AppColor.googleBlue,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              right: 0,
              child: InkWell(
                onTap: () {
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;
                  final RenderBox cardBox =
                      context.findRenderObject() as RenderBox;
                  final Offset position =
                      cardBox.localToGlobal(Offset.zero, ancestor: overlay);
                  showMenu(
                      position: RelativeRect.fromLTRB(
                        position.dx + 50,
                        position.dy,
                        position.dx + cardBox.size.width - 20,
                        position.dy + cardBox.size.height,
                      ),
                      color: AppColor.white.withOpacity(0.9),
                      elevation: 3,
                      constraints:
                          const BoxConstraints(maxWidth: 120, maxHeight: 120),
                      context: context,
                      items: [
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Update",
                                style: GoogleFonts.poppins(
                                  fontSize: AppText.titre4(context),
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.googleBlue,
                                ),
                              ),
                              Icon(
                                Icons.draw_rounded,
                                color: AppColor.googleBlue,
                                size: 20,
                              ),
                            ],
                          ),
                          onTap: ()async {
                            await Provider.of<UserProvider>(context,listen: false).goToUpdate(user);
                            Navigator.pushNamed(context, "/update");
                          },
                        ),
                        PopupMenuItem(
                          onTap: () async {
                            Provider.of<DataProvider>(context, listen: false)
                                .removeUser(user);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Delete",
                                style: GoogleFonts.poppins(
                                  fontSize: AppText.titre4(context),
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.googleRed,
                                ),
                              ),
                              Icon(
                                Icons.delete,
                                color: AppColor.googleRed,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ]);
                },
                child: Icon(
                  Icons.more_vert_rounded,
                  color: AppColor.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: InkWell(
                onTap: () async {
                  await Provider.of<DataProvider>(context, listen: false)
                      .likeUser(user);
                },
                child: FaIcon(
                  color: user.favorite ? AppColor.googleRed : AppColor.white70,
                  FontAwesomeIcons.solidHeart,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: Device.getScreenWidth(context),
              height: Device.getScreenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  user.picture.contains("http")
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.picture),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(user.picture)),
                        ),
                  Gap(Device.getDeviceScreenWidth(context, 50)),
                  Text(
                    user.name,
                    style: GoogleFonts.poppins(
                      fontSize: AppText.p1(context),
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.phone,
                    style: GoogleFonts.poppins(
                      fontSize: AppText.p3(context),
                      fontWeight: FontWeight.w600,
                      color: AppColor.white70,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.country,
                    style: GoogleFonts.poppins(
                      fontSize: AppText.p2(context),
                      fontWeight: FontWeight.w500,
                      color: AppColor.white70,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Gap(Device.getDeviceScreenWidth(context, 50)),
                  PrimaryButton(
                    elevation: 2,
                    width: Device.getDeviceScreenWidth(context, 4),
                    height: Device.getDeviceScreenHeight(context, 25),
                    radius: AppRadius.radius50,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero,
                              content: user.picture.contains("http")
                                  ? TransparentImageCard(
                                      borderRadius: 20,
                                      contentMarginTop:
                                          Device.getScreenHeight(context) * 0.2,
                                      tags: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: AppRadius.radius10,
                                              color: AppColor.googleBlue),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text(
                                            "${user.city}, ${user.country}",
                                            style: GoogleFonts.poppins(
                                              fontSize: AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                      description: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Phone:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.phone,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Email:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.email,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Gender:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.gender,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Birthday:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.birthday,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Street:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.street,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "City:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.city,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                          Gap(Device.getDeviceScreenHeight(
                                              context, 150)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "State:",
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text(
                                                  user.state,
                                                  style: GoogleFonts.poppins(
                                                    fontSize:
                                                        AppText.p2(context),
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.googleBlue,
                                                  ),
                                                  softWrap: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        user.name.toUpperCase(),
                                        style: GoogleFonts.poppins(
                                          fontSize: AppText.titre3(context),
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.white,
                                        ),
                                        softWrap: true,
                                        textAlign: TextAlign.start,
                                      ),
                                      imageProvider: NetworkImage(user.picture),
                                      width: Device.getScreenWidth(context),
                                      height:
                                          Device.getScreenHeight(context) * 0.6,
                                    )
                                  : TransparentImageCard(
                                borderRadius: 20,
                                contentMarginTop:
                                Device.getScreenHeight(context) * 0.2,
                                tags: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: AppRadius.radius10,
                                        color: AppColor.googleBlue),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      "${user.city}, ${user.country}",
                                      style: GoogleFonts.poppins(
                                        fontSize: AppText.p2(context),
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white,
                                      ),
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                                description: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Phone:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.phone,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Email:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.email,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Gender:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.gender,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Birthday:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.birthday,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Street:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.street,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "City:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.city,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(Device.getDeviceScreenHeight(
                                        context, 150)),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "State:",
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Text(
                                            user.state,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                              AppText.p2(context),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.googleBlue,
                                            ),
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                title: Text(
                                  user.name.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: AppText.titre2(context),
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.white,
                                  ),
                                  softWrap: true,
                                  textAlign: TextAlign.start,
                                ),
                                imageProvider: FileImage(File(user.picture)),
                                width: Device.getScreenWidth(context),
                                height:
                                Device.getScreenHeight(context) * 0.6,
                              )
                            );
                          });
                    },
                    color: AppColor.googleRed,
                    child: Text(
                      "Details",
                      style: GoogleFonts.poppins(
                        fontSize: AppText.p2(context),
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
