import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
           children: [
             Image.asset(kSplashLogo,
               width: kSplashLogoWidth,
               height: kSplashLogoHeight,),
             SizedBox(
               height: kTextRegular2x,
             ),
             Image.asset(kSplashText,
               width: kSplashTextWidth,
               height: kSplashTextHeight,),
           ],
          ),
        ),
      ),
    );
  }
}
