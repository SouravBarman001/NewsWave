import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newswave/src/common_widgets/welcome_screen.dart';
import 'package:newswave/src/routing/getx_routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: Routes.page1,
      getPages:pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
