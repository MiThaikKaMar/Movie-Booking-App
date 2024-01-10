 import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/dimens.dart';

class CastItemView extends StatelessWidget {
   const CastItemView({super.key});

   @override
   Widget build(BuildContext context) {
     return Row(
       children: [
         ClipOval(
           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1rgx2JxRQnk50rGyd_BNjiM3IjtlqVzW22w&usqp=CAU",
           width: kMargin60,
           height: kMargin60,
           fit: BoxFit.cover,),
         ),
         const SizedBox(
           width: kMarginMedium2,
         ),
       ],
     );
   }
 }
