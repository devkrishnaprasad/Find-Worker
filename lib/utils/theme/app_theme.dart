import 'package:find_worker/utils/colors.dart';
import 'package:find_worker/utils/fonts.dart';
import 'package:flutter/material.dart';

InputDecorationTheme textFiledDecoration = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  labelStyle: labelText.copyWith(color: blackColor),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: shadowColor, width: 0.5),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: shadowColor, width: 0.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: shadowColor, width: 0.5),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: shadowColor, width: 0.5),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
);

ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: mainTitle.copyWith(fontSize: 10),
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
    disabledBackgroundColor: shadowColor,
    disabledForegroundColor: shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    minimumSize: const Size.fromHeight(50),
  ),
);

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: whiteColor,
  foregroundColor: whiteColor,
  iconTheme: IconThemeData(color: blackColor),
);

DropdownMenuThemeData dropdownThemeData = DropdownMenuThemeData(
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(255, 219, 60, 60),
    labelStyle: labelText.copyWith(color: blackColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: shadowColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: shadowColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: primaryColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: shadowColor),
    ),
  ),
);

BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15.0),
  boxShadow: [
    BoxShadow(
      color: shadowColor.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ],
);

BottomSheetThemeData bottomSheetThemeData =
    const BottomSheetThemeData(backgroundColor: whiteColor);
