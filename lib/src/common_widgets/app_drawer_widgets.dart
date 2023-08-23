import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({super.key});

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('images/drawer/gradient-2.jpg', fit: BoxFit.cover),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //const SizedBox(height: 100,),
                      //Image.asset(name)
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'lottie_animation/user.json',
                                width: 230,
                                height: 130,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 30), // Adding spacing between animation and text
                            ],
                          ),
                          Positioned(
                            top: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sourav',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'sourav.iit.nstu@gmail.com',
                                  style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // You can add any child widgets on top of the image here
                ),
              ],
            ),
          ),
          Expanded(
              flex: 5
              ,child: Container(
            color: const Color(0xfff8f8f8),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title:Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title:Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title:Text(
                    'Log out',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
