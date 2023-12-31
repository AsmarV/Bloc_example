import 'package:bloc_example/core/utils/responsive.dart';
import 'package:flutter/material.dart';

String title = 'Business Logic Component';
GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

const Color primeColor = Color(0xffB26D76);
const Color shadePrimeColor = Color(0xffECBEC9);
const Color secondaryColor = Color(0xffB6F2FE);
const Color shadeSecondaryColor = Color(0xffDCFBFF);
const Color backGroundColor = Color(0xffF8FDFF);
const Color backGroundColorWh = Color(0xffffffff);

const Color whiteC = Color(0xffffffff);
const Color blackC = Color(0xff000000);

const Color errorColor = Color(0xffE65645);
const Color warningColor = Color(0xffEDCA41);
const Color successColor = Color(0xff56C990);
const Color updateColor = Color(0xff228DBE);
const Color noteColor = Color(0xffF7E8A4);

ThemeData lightTheme = ThemeData(
    fontFamily: 'Lexend',
    colorScheme: const ColorScheme.light(
      background: backGroundColorWh,
      primary: primeColor,
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backGroundColorWh,
        titleTextStyle: TextStyle(
            color: primeColor,
            fontSize: 16,
            fontWeight: FontWeight.bold)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primeColor, elevation: 0),
    primaryColor: primeColor,
    focusColor: primeColor,
    useMaterial3: true,
    hintColor: shadePrimeColor,
    scaffoldBackgroundColor: backGroundColorWh);
