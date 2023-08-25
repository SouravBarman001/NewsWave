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


  Map<String, String> categoryImages = {
    'business': 'https://image.cnbcfm.com/api/v1/image/106174405-1570711107124gettyimages-1083841638.jpeg?v=1570711118&w=1920&h=1080',
    'entertainment': 'https://www.e-spincorp.com/wp-content/uploads/2017/10/industry-media-entertainment.jpg',
    'general': 'https://image.cnbcfm.com/api/v1/image/104515342-GettyImages-669903858.jpg?v=1532563827',
    'health': 'https://cms-api-in.myhealthcare.co/image/20220910103120.jpeg',
    'science': 'https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=2000',
    'sports': 'https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?w=2000',
    'technology': 'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg',
  };


  int currentIndex = 0;
  CarouselController controller = CarouselController();


  @override
  Widget build(BuildContext context) {

    List<Widget> carouselItems = [];

    categoryImages.forEach((category, imageUrl) {
      carouselItems.add(
          GestureDetector(


            onTap: (){
              // context.pushTransparentRoute(
              //     BannerDetails(articleList: e,index:currentIndex,)
              // );
             // Get.to(() => BannerDetails(articleList: e,index: currentIndex,));
              print(category);
            },
            child: Card(
              elevation: 3,
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
                      imageUrl.toString(), // Use the URL from your Article data
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.5),

                    ),// Adjust opacity as needed
                  ),
                  // Slide Content
                  Align(
                    // alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.toString(),style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),)
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
          ),
      );
    });

    return Column(
      children: [
        CarouselSlider(

          carouselController: controller,
          items: carouselItems,
          options: CarouselOptions(
            scrollPhysics: const FixedExtentScrollPhysics(),
            // autoPlayAnimationDuration : const Duration(seconds: 2),
            // autoPlay: true,
            viewportFraction: 0.5,
            //enableInfiniteScroll : true,
            autoPlayCurve : Curves.decelerate,
            autoPlayInterval:const Duration(seconds: 3),
            height: 200,
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

      ],
    );
  }
}
