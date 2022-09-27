import 'package:flutter/material.dart';

const bodyTextSize = 24.0;
const largeTextSize = 36.0;
const pageTitleSize = 48.0;

// fonts are stored in assets/fonts and notified in pubspec.yaml
const portLligatSans = 'PortLligatSans';

const Color _darkGreen = Color(0xff264653);
const Color _lightGreen = Color(0xff2A9D8F);
const Color _yellow = Color(0xffE9C46A);

ThemeData myTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: _darkGreen,
  scaffoldBackgroundColor: _darkGreen,
  // body background color of a scaffold if you don't set a container
  canvasColor: _darkGreen,
  cardColor: _lightGreen,
  dividerColor: _yellow,
  dialogBackgroundColor: _lightGreen,
  appBarTheme: const AppBarTheme(
    backgroundColor: _darkGreen,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: portLligatSans,
      fontWeight: FontWeight.w300,
      fontSize: bodyTextSize,
    ),
    centerTitle: true,
  ),
  chipTheme: const ChipThemeData(
      backgroundColor: _darkGreen,
      disabledColor: _darkGreen,
      selectedColor: _darkGreen,
      secondarySelectedColor: _darkGreen,
      padding: EdgeInsets.all(0.0),
      labelStyle: TextStyle(
        fontFamily: portLligatSans,
        fontWeight: FontWeight.w300,
        fontSize: 16.0,
      ),
      secondaryLabelStyle: TextStyle(
        fontFamily: portLligatSans,
        fontWeight: FontWeight.w300,
        fontSize: 16.0,
      ),
      brightness: Brightness.dark),
  textTheme: const TextTheme(
    // For common text (not titles and not in buttons)
    bodyText2: TextStyle(
      fontFamily: portLligatSans,
      fontWeight: FontWeight.w300,
      fontSize: bodyTextSize,
    ),
    // For Favorites, History, Presentation and Result titles
    headline1: TextStyle(
      fontFamily: portLligatSans,
      fontWeight: FontWeight.w300,
      fontSize: pageTitleSize,
      color: Colors.white,
    ),
    // Used for the primary text in lists (eg. ListTile.title)
    subtitle1: TextStyle(
      fontFamily: portLligatSans,
      fontWeight: FontWeight.w300,
      fontSize: 24.0,
    ),
    // I don’t see the use, so I can define it to reuse it on my will
    bodyText1: TextStyle(
      fontFamily: portLligatSans,
      fontWeight: FontWeight.w300,
      fontSize: largeTextSize,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: portLligatSans,
          fontWeight: FontWeight.w300,
          fontSize: bodyTextSize,
        ),
      ),
    ),
  ),
);
