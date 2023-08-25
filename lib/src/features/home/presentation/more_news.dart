
import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newswave/src/common_widgets/shimmer_effect.dart';
import 'package:newswave/src/features/home/presentation/providers/banner_article_provider.dart';
import 'package:newswave/src/features/home/presentation/providers/body_article_provider.dart';

import '../../../common_widgets/app_drawer_widgets.dart';
import '../../../common_widgets/news_details.dart';
import '../domain/banner_article_model.dart';
import 'home_screen_banner.dart';
import 'home_screen_body.dart';

class MoreNews extends ConsumerStatefulWidget {
  const MoreNews({super.key});

  @override
  ConsumerState<MoreNews> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MoreNews> {


  Future<void> _bodyRefresh() async {
    try {
      ref.refresh(bodyArticleProvider);
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(bodyArticleProvider);

    return Scaffold(
      drawer: const Drawer(
        //  surfaceTintColor:Colors.black,
        elevation: 0,
        child: AppDrawerWidget(),
      ),
      appBar: AppBar(
        //iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_open_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text.rich(
          TextSpan(
              text: 'News',
              style: GoogleFonts.telex(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
              children: [
                TextSpan(
                  text: 'Wave',
                  style: GoogleFonts.telex(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),
                )
              ]
          ),



        ),
      ),
      body:  RefreshIndicator(
        displacement: 10,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {

          _bodyRefresh();
          //return await ref.refresh(bannerArticleProvider);
          // return ref.refresh(bodyArticleProvider)

        },
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All business headlines',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),),
                InkWell(
                    onTap: (){
                     // Get.toNamed('moreNews');
                    },
                    child: const Icon(Icons.expand_circle_down)),
              ],
            ),
            const SizedBox(height: 18,),
            apiData.when(
              data: (apiData){
                List<Article> articleList = apiData.map((e) => e).toList();
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: articleList.length,
                    itemBuilder: (BuildContext context,index){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 18),
                        width: double.infinity,
                        child: InkWell(
                          onTap: (){
                            //  Get.to(() => NewsDetails(articleList: articleList[index],index: index,));

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => NewsDetails(articleList: articleList[index],index : index))
                            // );
                            context.pushTransparentRoute(
                                NewsDetails(articleList: articleList[index],index:'${index}b',)
                            );


                          },
                          child: Hero(
                            tag: 'article_hero_${index}b',
                            child: Material(
                              borderRadius: BorderRadius.circular(15),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: articleList[index].urlToImage.toString(), // Use the URL from your Article data
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                          const SmallShimmerEffect(),
                                          errorWidget: (context, url, error) =>
                                          const Center(child: Icon(Icons.error)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),

                                    Expanded(
                                      child: AutoSizeText(
                                        articleList[index].title.toString(),
                                        style: GoogleFonts.poppins(
                                          height: 1.5,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        minFontSize: 15,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
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
                  BodyShimmerEffect(),
                  SizedBox(height: 5,),
                  BodyShimmerEffect(),
                  SizedBox(height: 5,),

                  BodyShimmerEffect(),
                  SizedBox(height: 5,),

                  BodyShimmerEffect(),
                  SizedBox(height: 5,),

                  BodyShimmerEffect(),
                  SizedBox(height: 5,),

                  BodyShimmerEffect(),
                ],
              ),),
            // const SizedBox(height: 10,),


          ],
        ),
      ),
    ),
      ),

    );
  }
}