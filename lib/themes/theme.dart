import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  backgroundColor: Colors.white,
  primaryColor: Color.fromRGBO(64, 64, 64, 1),
  accentColor: Color.fromRGBO(47, 127, 240, 1),
  shadowColor: Colors.grey.withOpacity(0.5),
  textTheme: TextTheme(

    ///Текст для заголовков
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 30
    ),

    ///Текст для кнопок
    headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20
    ),

    ///Текст для подсказок
    headline3: TextStyle(
      color: Color.fromRGBO(190, 190, 190, 1.0),
      fontSize: 18,
      fontWeight: FontWeight.w400
    ),

    ///Текст для кнопок
    headline4: TextStyle(
      color: Color.fromRGBO(47, 127, 240, 1),
      fontWeight: FontWeight.w500,
      fontSize: 18
    ),

    ///Текст маленького размера для информации
    headline5: TextStyle(
        color: Color.fromRGBO(130, 130, 130, 1.0),
        fontSize: 15,
        fontWeight: FontWeight.w500
    ),


  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color.fromRGBO(47, 127, 240, 1),
    textTheme: ButtonTextTheme.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color.fromRGBO(190, 190, 190, 1),
    size: 20
  )
);