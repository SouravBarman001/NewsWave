import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../constants/media_query_data.dart';
import 'package:google_fonts/google_fonts.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
   final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.57,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff002f61)),
                   child: Image.asset('images/welcome/pic-1.gif'),
                ),
                const SizedBox(height: 35,),
                 Text('Greetings, News Enthusiast!',style: GoogleFonts.outfit(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),),
                const SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                //  color: Colors.grey,
                  height: 60,
                  child:  Text('Welcome aboard NewsWave, your ultimate news companion'
                      ' that ensures you are always riding the crest of current events.',style:GoogleFonts.outfit(
                    fontSize: 15,

                  ),textAlign: TextAlign.justify,),
                ),
                const SizedBox(height: 30,),

                Container(
                 height: 55,
                 margin: const EdgeInsets.symmetric(horizontal: 15),

                 width: double.infinity,
               //  color: Colors.green,
                 child:  Row(
                   //mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Expanded(
                       flex: 3,
                       child: Container(
                         decoration: const BoxDecoration(
                           color: Color(0xffF89AEE),
                           borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(15),
                               bottomLeft: Radius.circular(15)
                           )
                         ),
                         alignment: Alignment.center,
                         child: Text('Sign in',style: GoogleFonts.outfit(
                             fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),),
                       ),
                     ),
                     Expanded(
                       flex: 2,
                       child: InkWell(
                         onTap: (){
                           Get.toNamed('login');
                         },
                         child: Container(
                           decoration: const BoxDecoration(

                               color: Color(0xffF3F3F3),
                               borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(15),
                                   bottomRight: Radius.circular(15)
                               )
                           ),
                           alignment: Alignment.center,
                           child: Text('Sign in',style: GoogleFonts.outfit(
                               fontSize: 19,fontWeight: FontWeight.bold,color: const Color(0xff545151)),),
                         ),
                       ),
                     ),


                   ],
                 ),
               ),
                SizedBox(height: orientation == Orientation.landscape ? height * 0.1 : height * 0,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
