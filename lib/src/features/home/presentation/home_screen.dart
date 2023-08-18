import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newswave/src/features/collections/presentation/collection_screen.dart';
import 'package:newswave/src/features/search/presentation/search_screen.dart';
import 'package:newswave/src/features/settings/presentation/settings_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/bottom_navigation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Country List
  List<String> countryList = [
    "PAKISTAN",
    "INDIA",
    "JAPAN",
    "AUSTRALIA",
    "RUSSIA",
    "BELIZE"
  ];

  int currentIndex = 0;

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const Drawer(
      //  surfaceTintColor:Colors.black,
        elevation: 0,
        child: Icon(Icons.menu,color: Colors.black,),
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
      body:  SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              carouselController: controller,
              items: countryList.map((e) {
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(e.trim().toString()),
                        Text(e.trim().toString()),

                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                onPageChanged: (val, _) {
                  // No need to use setState here
                  setState(() {
                    currentIndex = val;
                  });
                  print("new index $val");
                  controller.jumpToPage(val);
                },
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              dotsCount: countryList.length,
              position: currentIndex,
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(2),
                activeColor: Colors.blue,
                size: const Size.square(12.0),
                activeSize: const Size.square(12.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ),

    );
  }
}