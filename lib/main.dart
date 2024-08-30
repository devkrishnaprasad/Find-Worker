import 'package:find_worker/features/navigation/navbar.dart';
import 'package:find_worker/features/navigation/navbar_cubit.dart';
import 'package:find_worker/utils/colors.dart';
import 'package:find_worker/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Worker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: appBarTheme,
        dropdownMenuTheme: dropdownThemeData,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: blackColor,
        ),
        elevatedButtonTheme: lightElevatedButtonTheme,
        scaffoldBackgroundColor: whiteColor,
        inputDecorationTheme: textFiledDecoration,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        bottomSheetTheme: bottomSheetThemeData,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: const MainWrapper(),
      ),
    );
  }
}
