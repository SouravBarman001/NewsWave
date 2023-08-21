import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.outfit(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 22, top: 4),
                          hintText: "Username , Email & Phone Number",
                          hintStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 22, top: 4),
                          hintText: "Password",
                          hintStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password ?',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>BottomNavigation());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffF89AEE),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2, child: Image.asset('images/login/left.png')),
                      // const SizedBox(width: 14,),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Or Sign up With',
                          style: GoogleFonts.outfit(
                              fontSize: 15,
                              fontWeight: FontWeight.w400),textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Image.asset('images/login/right.png')),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/google.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/Facbook.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/apple.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
