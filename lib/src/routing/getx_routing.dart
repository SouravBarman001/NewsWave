import 'package:get/get.dart';
import 'package:newswave/src/common_widgets/welcome_screen.dart';
import 'package:newswave/src/features/login/presentation/login_screen.dart';

/// used to declare all the routes in strings so that
/// we can navigate through only the page names
class Routes {
  static String page1 = "/welcome";
  static String page2 = "/login";
  static String page3 = "/page3";
  static String page4 = "/page4";
  static String page5 = "/page5";
  static String page6 = "/page6";
}

/// assign this list variable into your GetMaterialApp as the value of getPages parameter.
/// you can get the reference to the above GetMaterialApp code.
final pages = [
  GetPage(
    name: Routes.page1,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: Routes.page2,
    page: () => const LoginScreen(),
  ),

];