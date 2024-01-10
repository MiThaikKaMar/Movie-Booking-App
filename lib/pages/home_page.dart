import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_movie_booking_app/list_items/movie_list_item_view.dart';
import 'package:the_movie_booking_app/pages/movie_details_page.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../utils/dimens.dart';
import '../utils/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        title: Row(
          children: [
            const SizedBox(
              width: kMarginMedium2,
            ),
            Image.asset(
              kLocationIcon,
              width: kLocationIconSize,
              height: kLocationIconSize,
            ),
            const Text(
              "Yangon",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: kTextRegular2x,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kMarginXLarge,
          ),
          // Image.asset(
          //   kScanIcon,
          //   width: kMarginLarge,
          //   height: kMarginLarge,
          // ),
          Icon(
            Icons.qr_code,
            color: Colors.white,
            size: kMarginLarge,
          ),
          SizedBox(
            width: kHomeScreenAppBarRightMargin,
          ),
        ],
      ),
      body: const HomeScreenBodyView(),
    );
  }
}

class HomeScreenBodyView extends StatefulWidget {
  const HomeScreenBodyView({super.key});

  @override
  State<HomeScreenBodyView> createState() => _HomeScreenBodyViewState();
}

class _HomeScreenBodyViewState extends State<HomeScreenBodyView> {
  String selectedText = kNowShowingLabel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BannerSectionView(),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        /// Now Playing and Coming Soon Tab Bar
        SliverToBoxAdapter(
          child: NowShowingAndComingSoonTabBar(
            selectedText: selectedText,
            onTapNowShowingOrComingSoon: (text) {
              setState(() {
                selectedText = text;
              });
            },
          ),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,
          ),
        ),

        /// Movie List Grid View
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MovieDetailsPage()));
                        },
                        child: MovieListItemView(
                          isSelectedComingSoon:
                              selectedText == kComingSoonLabel,
                        ));
                  },
                  childCount: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: kMovieListItemHeight,
                  mainAxisSpacing: kMargin30,
                  crossAxisSpacing: kMargin30,
                ))),
      ],
    );
  }
}

/// Banner
class BannerSectionView extends StatelessWidget {
  BannerSectionView({super.key});

  final PageController _bannerPageController =
      PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Page View
        SizedBox(
          height: kBannerHeight,
          child: PageView.builder(
            controller: _bannerPageController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: kMarginMedium),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kMarginMedium),
                  child: Image.asset(
                    kDummyImg,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
        const SizedBox(
          height: kMarginMedium2,
        ),

        /// Dots Indicator
        SmoothPageIndicator(
          controller: _bannerPageController,
          count: 5,
          effect: const SlideEffect(
            dotColor: kInactiveDotsColor,
            activeDotColor: kPrimaryColor,
            dotHeight: kMarginMedium,
            dotWidth: kMarginMedium,
          ),
          onDotClicked: (index) {
            _bannerPageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut);
          },
        ),
      ],
    );
  }
}

class NowShowingAndComingSoonTabBar extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapNowShowingOrComingSoon;

  const NowShowingAndComingSoonTabBar(
      {super.key,
      required this.selectedText,
      required this.onTapNowShowingOrComingSoon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMargin5),
          gradient: const RadialGradient(
            colors: [
              kNowPlayingAndComingSoonGradientStartColor,
              kNowPlayingAndComingSoonGradientEndColor
            ],
            radius: 7.5,
            center: Alignment(0, -0.02),
          )),
      child: Row(
        children: [
          ///Now Showing Button
          Expanded(
            child: NowShowingOrComingSoonButtonView(
              isSelected: selectedText == kNowShowingLabel,
              label: kNowShowingLabel,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kNowShowingLabel);
              },
            ),
          ),

          ///and Coming Soon Button
          Expanded(
            child: NowShowingOrComingSoonButtonView(
              isSelected: selectedText == kComingSoonLabel,
              label: kComingSoonLabel,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kComingSoonLabel);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Now Showing and Coming Soon Button View
class NowShowingOrComingSoonButtonView extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapButton;

  //final Function(String) onTapButton;

  const NowShowingOrComingSoonButtonView({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapButton();
      },
      child: Container(
        height: kNowPlayingAndComingSoonTabBarHeight,
        margin: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
          color: (isSelected) ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(kMarginSmall),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected)
                  ? kNowPlayingAndComingSoonSelectedTextColor
                  : kNowPlayingAndComingSoonUnSelectedTextColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
