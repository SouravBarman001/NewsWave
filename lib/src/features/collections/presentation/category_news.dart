import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newswave/src/features/home/application/banner_services/home_api.dart';
import 'package:newswave/src/features/home/domain/banner_article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../common_widgets/banner_details.dart';
import '../../../common_widgets/news_details.dart';
import 'package:intl/intl.dart';

import '../../home/presentation/providers/banner_article_provider.dart';

class CategoryNews extends ConsumerStatefulWidget {
  const CategoryNews({super.key});

  @override
  ConsumerState<CategoryNews> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends ConsumerState<CategoryNews> {

  int currentIndex = 0;
  CarouselController controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(bannerArticleProvider);
    return apiData.when(
      data: (apiData) {
        List<Article> articleList = apiData.map((e) => e).toList();
        return Column(
          children: [
            CarouselSlider(

              carouselController: controller,
              items: articleList.map((e) {
                DateTime dateTime = DateTime.parse(e.publishedAt);
                // Convert the time to Bangladesh time zone
                final bdTimezone = dateTime.toLocal();
                // Format the time in the desired format
                String formattedTime =
                DateFormat("HH:mm", 'en_US').format(bdTimezone);

                //  print(formattedTime);

                return GestureDetector(


                  onTap: (){
                    // context.pushTransparentRoute(
                    //     BannerDetails(articleList: e,index:currentIndex,)
                    // );
                    Get.to(() => BannerDetails(articleList: e,index: currentIndex,));

                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.green,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl:
                            e.urlToImage, // Use the URL from your Article data
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        // Slide Content
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      // Wrap this text widget with Expanded
                                      child: Text(
                                        e.title, // Use the title from your Article data
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        formattedTime
                                            .toString(), // Replace with actual time data
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // Rest of your slide content
                                // ...
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(height: 10),

                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                scrollPhysics: const FixedExtentScrollPhysics(),
                // autoPlayAnimationDuration : const Duration(seconds: 2),
                autoPlay: true,
                autoPlayCurve : Curves.decelerate,
                autoPlayInterval:const Duration(seconds: 3),
                height: 300,
                onPageChanged: (val, _) {
                  // No need to use setState here
                  setState(() {
                    currentIndex = val;
                  });
                  print("new index $val");
                  //   controller.jumpToPage(val);

                  controller.animateToPage(val,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.decelerate);

                },
              ),
            ),
            const SizedBox(height: 10,),
            DotsIndicator(
              dotsCount: articleList.length,
              position: currentIndex,
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(2),
                activeColor: const Color(0xff444698),
                color: const Color(0xff999b9d),
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
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
      ),
    );
  }
}
