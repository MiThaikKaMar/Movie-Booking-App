import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';
import 'package:the_movie_booking_app/utils/images.dart';
import 'package:the_movie_booking_app/utils/strings.dart';

import '../list_items/cast_item_view.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
/// Body
          const SingleChildScrollView(
            child: Column(
              children: [
                ///Movie large, small image and info
                MovieLargeSmallImageAndInfoView(),
                
                /// Spacer
                SizedBox(
                  height: kMargin30,
                ),
                
                /// Censor Rating, Release Date and Duration
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
                  child: CensorRatingReleaseDateAndDurationView(),
                ),

                /// Spacer
                SizedBox(
                  height: kMargin30,
                ),

               /// Story Line View
                StoryLineView(),


                /// Casts
                CastsView(),

                SizedBox(
                  height: 148,
                )
                
              ],
            ),
          ),


          /// App Bar
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kMarginLarge, vertical: kMarginMedium),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: kMarginXLarge,
                  ),
                ),

                /// Spacer
                const Spacer(),

                /// Share
                const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: kMarginXLarge,
                ),
              ],
            ),
          ),

          /// Bottom Gradient and Booking Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: kMovieDetailBottomContainerHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent,kBackgroundColor],
                ),
              ),
              child: const Center(
                child: BookingButtonView(),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class BookingButtonView extends StatelessWidget {
  const BookingButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: kBookingButtonHeight,

      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
              child: Image.asset(kBookingButtonEnd,)),

          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: kBookingButtonHeight,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: const Center(
                child: Text(kBookingLabel,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),),
              ),
            ),
          ),

          Align(
              alignment: Alignment.centerRight,
              child: Image.asset(kBookingButtonEnd,)),
        ],
      )
    );
  }
}



class CastsView extends StatelessWidget {
  const CastsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Cast Label
        const Padding(padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
        child: Text("Cast",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: kTextRegular,
        ),),),

        const SizedBox(
          height: kMarginMedium3,
        ),

        SizedBox(
          height: kMargin60,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
return const CastItemView();
          },
          itemCount: 10,
          ),
        )
      ],
    );
  }
}


class StoryLineView extends StatelessWidget {
  const StoryLineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Story Line",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(
            height: kMarginMedium,
          ),
          Text("In Action Comics #1 (1938), Superman is born on an alien world to a technologically advanced species that resembles humans. Shortly after he is born, his planet is destroyed in a natural cataclysm, but Superman's scientist father foresaw the calamity and saves his baby son by sending him to Earth in a small spaceship.",
            style: TextStyle(
              color: Colors.white,
              fontSize: kTextRegular,
              fontWeight: FontWeight.w500,
            ),),

          /// Spacer
          SizedBox(
            height: kMargin30,
          ),
        ],
      )
    );
  }
}

class MovieLargeSmallImageAndInfoView extends StatelessWidget {
  const MovieLargeSmallImageAndInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieDetailTopSectionHeight,
      child: Stack(
        children: [
          /// Large Image and Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
/// Large Image
              Image.network("https://static.toiimg.com/thumb/msid-87094191,width-1070,height-580,imgsize-61716,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
              height: kMovieDetailTopImageHeight,
              fit: BoxFit.cover,
                width: double.infinity,
              ),

              const SizedBox(
                height: kMarginMedium2,
              ),
              ///movie info
              MovieInfoAndGenreView(),


            ],
          ),
          ///Small Image
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: kMarginMedium2,bottom: kMarginMedium2),
              child: Image.network("https://m.media-amazon.com/images/M/MV5BMzI0NmVkMjEtYmY4MS00ZDMxLTlkZmEtMzU4MDQxYTMzMjU2XkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg",
              height: kMovieDetailSmallImageHeight,
              width: kMovieDetailSmallImageWidth,
              fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}

class MovieInfoAndGenreView extends StatelessWidget {

  final List<String> genreList = ["Action","Adventure","Drama","Animation"];

  MovieInfoAndGenreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child: Padding(
        padding: const EdgeInsets.only(left: kMarginMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Movie Name and Rating
            const MovieNameAndRatingView(),



            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Type
            const Text("2D, 3D, 3D IMAX, 3D DEBOX",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: kTextRegular2x,
              ),),

            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Genres
            Wrap(
              spacing: kMarginMedium,
              runSpacing: kMarginMedium,
              children: genreList.map((genre) => Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kMarginCardMedium2),),
                padding: const EdgeInsets.symmetric(horizontal: kMarginMedium,vertical: kMarginSmall),
                child: Text(genre,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: kTextSmall,
                ),),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
  
}

class MovieNameAndRatingView extends StatelessWidget {
  const MovieNameAndRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
/// Movie Name
        const Text("Venom 2",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: kTextRegular2x,
        ),),

        const SizedBox(
          width: kMarginMedium,
        ),

        Image.asset(kIMdbImage,
          width: kIMDBWidth,
          height: kIMDBHeight,
        ),

        const Text("7.1",
        style: TextStyle(
          color: Colors.white,
          fontSize: kTextRegular2x,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}

class CensorRatingReleaseDateAndDurationView extends StatelessWidget {



  const CensorRatingReleaseDateAndDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CensorRatingReleaseDateDurationItemView(label: "Censor Rating",value: "U/A",),
        CensorRatingReleaseDateDurationItemView(label: "Release Date",value: "May 8th 2022",),
        CensorRatingReleaseDateDurationItemView(label: "Duration",value: "2hr 15min",),
      ],
    );
  }
}

class CensorRatingReleaseDateDurationItemView extends StatelessWidget {

  final String label;
  final String value;

  const CensorRatingReleaseDateDurationItemView({
    super.key,required this.label,required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginCardMedium2),
        gradient: const LinearGradient(
          colors: [kMovieDetailCensorRatingGradientStartColor,
          kMovieDetailCensorRatingGradientEndColor],
        ),
      ),
      child: Column(
        children: [
          Text(label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: kTextSmall
          ),),
          const SizedBox(
            height: kMarginMedium,
          ),
          Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: kTextRegular
            ),),
        ],
      ),
    );
  }
}


