import 'package:flutter/material.dart';

class Device {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  }

  static double getStaticScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getStaticDeviceScreenWidth(BuildContext context, value) {
    return MediaQuery.of(context).size.width / value;
  }

  static double getDeviceScreenWidth(BuildContext context, value) {
    return getScreenWidth(context) / value;
  }

  static double getMultipleScreenWidth(BuildContext context, value) {
    return getScreenWidth(context) * value;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
  }

  static double getStaticScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getStaticDeviceScreenHeight(BuildContext context, value) {
    return MediaQuery.of(context).size.height / value;
  }

  static double getDeviceScreenHeight(BuildContext context, value) {
    return getScreenHeight(context) / value;
  }

  static double getMultipleScreenHeight(BuildContext context, value) {
    return getScreenHeight(context) * value;
  }
}
