import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  /// This is for choose document section    *
  // Initial Selected Value
  String document = 'AED 55,000';
  // List of items in our dropdown menu
  var documentTypes = ['AED 55,000', 'AED 55,500', 'AED 56,000', 'AED 56,500'];

  // ignore: prefer_typing_uninitialized_variables
  var checkOrientation;
  static const textColor = Color(0xff3C3A3A);

  var smallText = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  var profileMediumText =GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  var hintTextStyleProfile = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
     checkOrientation = MediaQuery.of(context).orientation;
    // final productDetailsProvider = Provider.of<ProductDetailsProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color(0xffFAF7E4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff737373),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              height: screenHeight * .65,
              width: screenWidth * 1,
              child: AnotherCarousel(
                dotBgColor: const Color(0xff00ffffff),
                // overlayShadowSize:0.6,
                dotIncreaseSize: 1,
                autoplay: false,
                dotSize: 10.0,
                dotSpacing: 16,
                // dotColor: Colors.white,
                // dotIncreasedColor:Colors.black,
                // dotSpacing: 15.0,
                // dotPosition: DotPosition.bottomCenter,
                images: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.cover,
                      ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    child: Image.network(
                      'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    child: Image.network(
                      'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              //color:Colors.blue,
              margin: const EdgeInsets.only(left: 17, top: 9, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rolex',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'DAY-DATE',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          // Divider(
                          //   height: 16,
                          //   color: Color(0xff71375f),
                          //  // thickness: 5,
                          // )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 5,
                    width: screenWidth * 1,
                    child: const Divider(
                      color: Color(0xff71375f),
                      thickness: 0.2,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 17, top: 13, right: 23),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Starting Bid',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'AED 30,000',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Bid',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'AED 50,000',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Increment',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'AED 1,000',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time Left',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                      Text(
                        '5 days',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bid History',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        //  productDetailsProvider.visibilityCheck();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.chevron_down,
                                size: 12,
                                weight: 0.1,
                                color: Color(0xff71375F),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '9 bids',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.0,
                                  color: const Color(0xff71375F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 17,),
            const SizedBox(
              height: 16,
            ),

            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 5,
              width: screenWidth * 1,
              child: const Divider(
                endIndent: 22,
                indent: 17,
                color: Color(0xff71375f),
                thickness: 0.2,
              ),
            ),
            // Product Details Container

            Container(
              margin: const EdgeInsets.only(top: 20),
              //color: Colors.blue,
              padding: const EdgeInsets.only(left: 17, right: 15),
              width: screenWidth * 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Product Details',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Reference Number',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '18238',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Condition',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'very good',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Scope of Delivery',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Watch with original box',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Year of Production',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Unknown',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Case Diameter',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '30 mm',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Lug Width',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '3 mm',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Movement',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Manual winding',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description

            Container(
              margin: const EdgeInsets.only(top: 26, bottom: 64),
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 17, right: 15),
              width: screenWidth * 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff3C3A3A),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: screenWidth * 1,
                      child: Text(
                        "Manual windLorem ipsum dolor sit amet, consectetur adipiscing elit,"
                        " sed do eiusmod tempor incididunt ut labore et dolore"
                        " magna aliqua. Manual windLorem ipsum dolor sit amet, "
                        "consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                        "ut labore et dolore magna aliqua.",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: const Color(0xff3C3A3A),
                          height: 1.8, // Adjust the line height here
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
