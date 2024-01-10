import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/login_page.dart';
import 'package:the_movie_booking_app/pages/main_page.dart';
import 'package:the_movie_booking_app/pages/splash_page.dart';
import 'package:the_movie_booking_app/utils/fonts.dart';

void main() {
  runApp(const MobileBookingApp());
}

class MobileBookingApp extends StatelessWidget {
  const MobileBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: kSans,
      ),
      home: const LoginPage(),
    );
  }
}
