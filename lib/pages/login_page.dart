import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/utils/colors.dart';

import '../utils/dimens.dart';
import '../utils/images.dart';
import '../utils/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              SizedBox(
                height: kSplashLogoWidth,
              ),
              Image.asset(
                kSplashLogo,
                width: kSplashLogoWidth,
                height: kSplashLogoHeight,
              ),
              SizedBox(
                height: kMargin64,
              ),
              
              /// Title and text
              Text(
                kVerifyTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: kMarginLarge,
                ),
              ),
              SizedBox(
                height: kMarginSmall,
              ),
              Text(
                kVerifyText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kVerifyTextColor,
                  fontSize: kTextRegular,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: kMarginXXLarge,
              ),

              /// Verify Phone Number
              Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginXLarge),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Country Code",
                        style: TextStyle(
                          color: kVerifyTextColor,
                          fontSize: kTextSmall,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    /// Country Code and Phone no.
                    CountryCodePhoneNumberView(),

                    /// Spacer
                    SizedBox(
                      height: kMarginXLarge,
                    ),
                    /// Verify Phone Num Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kMarginMedium),
                        color: kPrimaryColor,
                      ),
                      child: TextButton(
                        onPressed: (){

                      },

                        child: Text(kVerifyTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w500,
                      ),),
                      ),
                    ),

                    SizedBox(
                      height: kMarginMedium,
                    ),
                    /// or divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: kDividerColor,
                            thickness: 1.0,
                          ),
                        ),
                        Text("or",
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        Expanded(
                          child: Divider(
                            color: kDividerColor,
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kMarginMedium,
                    ),
                    /// Google Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kMarginMedium),
                        color: Colors.white,
                      ),
                      child: TextButton.icon(
                        onPressed: (){

                        },

                        label: Text(kContinueWithGoogle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: kTextRegular,
                            fontWeight: FontWeight.w500,
                          ),), icon: Image.asset(kGoogleIcon,
                      width: kMarginLarge,
                      height: kMarginLarge,),
                      ),
                    ),
                    /// Policy Text
                   SizedBox(
                     height: kMarginXXLarge,
                   ),
                    
                    Text(kPolicyText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPolicyTextColor,
                      fontSize: kTextSmall,
                    ),)
                  ],
                ),
              )

              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}

class CountryCodePhoneNumberView extends StatefulWidget {
  const CountryCodePhoneNumberView({super.key});

  @override
  State<CountryCodePhoneNumberView> createState() => _CountryCodePhoneNumberViewState();
}

class _CountryCodePhoneNumberViewState extends State<CountryCodePhoneNumberView> {

  var dropDownItems = ["+95", "+65", "+66","+85"];
  var selectedItem = "";

  @override
  void initState() {
    super.initState();
    selectedItem = dropDownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Drop down list
        DropdownButton(
        value: selectedItem,
        dropdownColor: Colors.black,
        items: dropDownItems
            .map(
              (item) => DropdownMenuItem(
            value: item,
            child: Text(item,style: const TextStyle(color: Colors.white),),
          ),
        )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value ?? "";
          });
        }),
        /// Spacer
        SizedBox(
          width: kMarginMedium,
        ),

        /// Text Input
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: kMarginXLarge,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(
                    color: kVerifyTextColor,
                    fontSize: kTextRegular
                  )

                ),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
