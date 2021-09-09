import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'font.dart';

final TextStyle _textStyle = GoogleFonts.beVietnam(fontStyle: FontStyle.normal, fontSize: 16);
final TextStyle _boldStyle = _textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

final TextStyle splashTitleStyle = _boldStyle.copyWith(fontSize: 30, color: accentColor);
final TextStyle appBarTitleStyle = _boldStyle.copyWith(fontSize: 18, color: appBarTitleColor);
final TextStyle appBarTitleWhiteStyle = _boldStyle.copyWith(fontSize: 18, color: Colors.white);

final TextStyle tabSelectedLabelStyle = _textStyle.copyWith(fontSize: 13, color: tabSelectedLabelColor);
final TextStyle tabUnselectedLabelStyle = _textStyle.copyWith(fontSize: 13, color: tabUnselectedLabelColor);

final TextStyle headLineTitleStyle = _textStyle.copyWith(fontSize: 15, color: blackColor);
final TextStyle headLineTitleBoldStyle = _boldStyle.copyWith(fontSize: 15, color: Colors.white);
final TextStyle newsAgoStyle = _textStyle.copyWith(fontSize: 12, color: Colors.black54);
final TextStyle allUnReadStyle = _textStyle.copyWith(fontSize: 14, color: Colors.black);

final TextStyle categoryNameStyle = _textStyle.copyWith(fontSize: 15, color: blackColor);

final TextStyle languageDefaultStyle = _textStyle.copyWith(fontSize: 15, color: blackColor);


flushBarMessageStyle(Color color) => TextStyle(fontSize: 12, color: color, fontFamily: mediumFont);
flushBarTitleStyle(Color color) => TextStyle(fontSize: 14, color: color, fontFamily: semiBoldFont);
