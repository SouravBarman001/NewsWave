import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/app_drawer_widgets.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
