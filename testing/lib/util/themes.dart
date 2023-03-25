import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: const Color(0xFF1c232d),
      titleTextStyle: TextStyle(
          color: Colors.white, fontFamily: 'IBMPlexSansThai', fontSize: 16.sp),
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'IBMPlexSansThai',
          bodyColor: Colors.black,
        ),
    primaryTextTheme: ThemeData.dark()
        .textTheme
        .apply(fontFamily: 'IBMPlexSansThai', bodyColor: Colors.black),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: const Color(0xFF1c232d),
      titleTextStyle: TextStyle(
          color: Colors.white, fontFamily: 'IBMPlexSansThai', fontSize: 16.sp),
    ),
    textTheme: ThemeData.dark()
        .textTheme
        .apply(fontFamily: 'IBMPlexSansThai', bodyColor: Colors.black),
    primaryTextTheme: ThemeData.dark()
        .textTheme
        .apply(fontFamily: 'IBMPlexSansThai', bodyColor: Colors.black),
  );
}
