import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newswave/src/features/home/domain/banner_article_model.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:intl/intl.dart';
import '../constants/media_query_data.dart';

class NewsDetails extends ConsumerStatefulWidget {
  const NewsDetails({super.key, required  this.articleList, required this.index});

  final Article articleList;
  final String index;

  @override
  ConsumerState<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends ConsumerState<NewsDetails> {


  Future<String> fetchData() async {
    // Replace with your actual data source logic
    await Future.delayed(const Duration(seconds: 2));
    return "2023-08-23T05:20:17Z";
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
     Article articleList = widget.articleList;

    var publishedAt = widget.articleList.publishedAt;
    var dateTime = DateTime.parse(publishedAt).toLocal();
    var formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);


    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      // Start of the optional properties
      isFullScreen: true,
      disabled: false,
      minRadius: 10,
      maxRadius: 10,
      dragSensitivity: 1.0,
      maxTransformValue: 1,
      direction: DismissiblePageDismissDirection.down,
      backgroundColor: Colors.black,
      onDragStart: () {
        print('onDragStart');
      },
      onDragUpdate: (details) {
        print(details);
      },
      dismissThresholds: const {
        DismissiblePageDismissDirection.vertical: .2,
      },
      minScale: .8,
      startingOpacity: 1,
      reverseDuration: const Duration(milliseconds: 250),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'article_hero_${widget.index}',
                  child: Stack(
                    children: [
                      Container(
                        height: height * .5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              articleList.urlToImage.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 15),
                                width: 40,
                                height: 40,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor: Colors.blueAccent,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20), //<-- SEE HERE
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FittedBox(
                          //<-- SEE HERE
                          child: FloatingActionButton(
                            heroTag: null,
                            //<-- SEE HERE
                            // backgroundColor: Colors.greenAccent,
                            onPressed: () {},
                            child: Image.asset(
                              'images/newsdetails/writer.png',
                              // width: 230,
                              // height: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 6,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          articleList.author.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                          minFontSize: 15,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  // height: 200,
               //   color: Colors.blueAccent,
                  child: AutoSizeText(
                   // articleList,
                    articleList.title.toString(),
                    style: GoogleFonts.poppins(
                      height: 1.5,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 15,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: double.infinity,
                  // height: 200,
                //  color: Colors.blueAccent,
                  child: AutoSizeText(
                    'Published At:  $formattedDateTime',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                    ),
                    minFontSize: 15,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 0.4,
                  indent: 17,
                  endIndent: 17,
                ),

                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15,),
                  width: double.infinity,
                  // height: 200,
                  //   color: Colors.red,
                  child: AutoSizeText(
                    articleList.description.toString(),
                    style: GoogleFonts.poppins(
                      height: 1.5,
                      fontSize: 15,

                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 15,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
