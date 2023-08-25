import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/domain/banner_article_model.dart';
import '../../home/presentation/providers/banner_article_provider.dart';

class OnlyCarousel extends ConsumerStatefulWidget {
  const OnlyCarousel({super.key});

  @override
  ConsumerState<OnlyCarousel> createState() => _OnlyCarouselState();
}

class _OnlyCarouselState extends ConsumerState<OnlyCarousel> {
  /// This is for choose document section    *
  // Initial Selected Value
  String document = 'AED 55,000';
  // List of items in our dropdown menu
  var documentTypes = ['AED 55,000', 'AED 55,500', 'AED 56,000', 'AED 56,500'];

  // ignore: prefer_typing_uninitialized_variables
  var checkOrientation;
  static const textColor = Color(0xff3C3A3A);

  var smallText = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  var profileMediumText =GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  var hintTextStyleProfile = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    checkOrientation = MediaQuery.of(context).orientation;
    final apiData = ref.watch(bannerArticleProvider);

    // final productDetailsProvider = Provider.of<ProductDetailsProvider>(context);






    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color(0xffFAF7E4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [

            apiData.when(
                data: (apiData){
                  List<Article> articleList = apiData.map((e) => e).toList();
                  return  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff737373),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    height: screenHeight * .65,
                    width: screenWidth * 1,
                    child: AnotherCarousel(
                      dotBgColor: const Color(0xff00ffffff),
                      // overlayShadowSize:0.6,
                      dotIncreaseSize: 1,
                      autoplay: false,
                      dotSize: 10.0,
                      dotSpacing: 16,
                      // dotColor: Colors.white,
                      // dotIncreasedColor:Colors.black,
                      // dotSpacing: 15.0,
                      // dotPosition: DotPosition.bottomCenter,
                      images: articleList.map((e){
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                          child: Image.network(
                            e.urlToImage.toString(),
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
                error: (error, s) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(Icons.error_outline),
                      ],
                    ),
                  ],
                ),
                loading: () => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        CircularProgressIndicator(),
                      ],
                    ),
                  ],
                ),)


          ],
        ),
      ),
    );
  }
}
