import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';

class MovieListItemView extends StatelessWidget {
  final bool isSelectedComingSoon;

  const MovieListItemView({super.key, required this.isSelectedComingSoon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(kMarginMedium),
      ),
      child: Column(
        children: [
          /// Movie Image and gradient
          Stack(
            children: [
              /// movie image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kMarginMedium),
                  topRight: Radius.circular(kMarginMedium),
                ),
                child: Image.network(
                  "https://m.media-amazon.com/images/M/MV5BMzI0NmVkMjEtYmY4MS00ZDMxLTlkZmEtMzU4MDQxYTMzMjU2XkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg",
                  fit: BoxFit.cover,
                  height: kMovieListItemImageHeight,
                  width: double.infinity,
                ),
              ),

              /// Gradient
              Container(
                height: kMovieListItemImageHeight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kMarginMedium),
                      topRight: Radius.circular(kMarginMedium),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.6, 1.0],
                    )),
              ),

              /// Indicator
              Align(
                alignment: Alignment.topRight,
                child: Visibility(
                  visible: isSelectedComingSoon,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: kMarginMedium, right: kMarginMedium),
                    child: Container(
                      width: kMarginXLarge,
                      height: kMarginXLarge,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kMarginMedium),
                      ),
                      child: const Center(
                        child: Text(
                          "8th\nAug",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: kTextXSmall,
                              color:
                                  kNowPlayingAndComingSoonUnSelectedTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// Movie Name and IMDB
          const MovieNameAndIMDBView(),

          /// Additional Info
          const AdditionalInfoView(),
        ],
      ),
    );
  }
}

class MovieNameAndIMDBView extends StatelessWidget {
  const MovieNameAndIMDBView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        children: [
          /// Name
          const Text(
            "Venom 2",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
            ),
          ),

          /// Spacer
          const Spacer(),

          /// IMDB
          Image.asset(
            kIMdbImage,
            width: kMarginXLarge,
            height: kMarginMedium3,
          ),
          //       Icon(Icons.add_reaction,
          //       color: Colors.yellow,),

          /// Rating
          const Text(
            "9.0",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class AdditionalInfoView extends StatelessWidget {
  const AdditionalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
      child: Row(
        children: [
          ///Restriction
          const Text(
            "U/A",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// Spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          ///circle
          Container(
            width: kMargin5,
            height: kMargin5,
            decoration: const BoxDecoration(
              color: kCircleColor,
              shape: BoxShape.circle,
            ),
          ),

          /// Spacer
          const SizedBox(
            width: kMarginMedium,
          ),

          ///Type
          const Text(
            "2D, 3D, 3D IMAX",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextSmall,
            ),
          ),
        ],
      ),
    );
  }
}
