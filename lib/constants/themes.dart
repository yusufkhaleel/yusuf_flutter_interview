import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff00b0ff);
const kSecondaryColor = Color(0xFF022238);
const kThirdColor = Color(0xFFFFDCBC);
const kLightBackground = Color(0xFFE8F6FB);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const KcardColour = Color(0xFFDFDFDF);

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const kBannerTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 16,
      fontWeight: FontWeight.bold,
  );

  static const ktitles = TextStyle(
    color: kWhiteColor,
    fontSize: 16,
  );

  static const kHeadingOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const kSeeAllText = TextStyle(color: kPrimaryColor);

  static final kBodyText = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12,
  );

  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
