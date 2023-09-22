import 'package:flutter/material.dart';
import 'package:travel_guide/constants/colors.dart';

class AppTextStyle {
  static TextStyle logoStyle = TextStyle(
      fontSize: 75, fontWeight: FontWeight.bold, color: AppColor.white);
  static TextStyle headingStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.white);
  static TextStyle subHeadingTextStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.faintedWhite);
  static TextStyle buttonTextStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
  static TextStyle bodyTextStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.bgColor);
  static TextStyle bodyText2Style = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.white);
  static TextStyle normalBodyTextStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.faintedWhite);
}
