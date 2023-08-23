import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/app_drawer_widgets.dart';
import '../../home/domain/banner_article_model.dart';
import '../../home/presentation/home_screen_banner.dart';
import '../../home/presentation/providers/banner_article_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({super.key});

  @override
  ConsumerState<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends ConsumerState<CollectionScreen> {

  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(bannerArticleProvider);

    return Scaffold(
      backgroundColor: Colors.red,
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
      body: RefreshIndicator(
        displacement: 10,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          // _bannerRefresh();
          // _bodyRefresh();
          //return await ref.refresh(bannerArticleProvider);
          // return ref.refresh(bodyArticleProvider)

        },
        child:  ListView(
          children: const [
            HomeScreenBanner(),
          ],
        ),
      ),
    );
  }
}
