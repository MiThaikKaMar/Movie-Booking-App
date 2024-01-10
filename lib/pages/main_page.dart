import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/cinemas_page.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/profile_page.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> screensWidget= [const HomePage(),const CinemasPage(),const TicketsPage(),const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottomNavigationUnSelectedColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationBarItems(),
      ),
      body: screensWidget[currentIndex],
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          kMovieIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kMovieIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kMoviesLabel,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          kCinemaIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kCinemaIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kCinemasLabel,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          kTicketIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kTicketIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kTicketsLabel,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          kProfileIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
        ),
        activeIcon: Image.asset(
          kProfileIcon,
          width: kMarginXLarge,
          height: kMarginXLarge,
          color: kPrimaryColor,
        ),
        label: kProfileLabel,
      ),
    ];
  }
}
