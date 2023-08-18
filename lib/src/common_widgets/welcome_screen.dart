import 'package:flutter/material.dart';

import '../constants/media_query_data.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(height: height * 0.5,
              color: Colors.grey,),

            ],
          ),
        ),
      ),
    );
  }
}
