import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quotes_app_adv_flutter/utils/theme.dart';
import 'package:quotes_app_adv_flutter/views/Components/add_component.dart';
import 'package:quotes_app_adv_flutter/views/Components/home_component.dart';
import 'package:quotes_app_adv_flutter/views/Components/library_component.dart';
import 'package:quotes_app_adv_flutter/views/Components/menu_component.dart';
import 'package:quotes_app_adv_flutter/views/Components/quotes_component.dart';
import 'package:quotes_app_adv_flutter/views/screens/creations_page.dart';
import 'package:quotes_app_adv_flutter/views/screens/details_page.dart';
import 'package:quotes_app_adv_flutter/views/screens/favourite_page.dart';
import 'package:quotes_app_adv_flutter/views/screens/home_page.dart';
import 'package:quotes_app_adv_flutter/views/screens/intro_page.dart';
import 'package:quotes_app_adv_flutter/views/screens/intro_page1.dart';
import 'package:quotes_app_adv_flutter/views/screens/intro_page2.dart';
import 'package:quotes_app_adv_flutter/views/screens/login_screen.dart';
import 'package:quotes_app_adv_flutter/views/screens/privacy_policy.dart';
import 'package:quotes_app_adv_flutter/views/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isIntroVisited = prefs.getBool('isIntroVisited') ?? false;

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    themeMode: ThemeMode.system,
    initialRoute: (isIntroVisited) ? 'LoginPage' : '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: '/LoginPage',
        page: () => LoginScreen(),
      ),
      GetPage(
        name: '/Intro_Page',
        page: () => const IntroPage(),
      ),
      GetPage(
        name: '/Intro_page1',
        page: () => const IntroPage1(),
      ),
      GetPage(
        name: '/Intro_page2',
        page: () => const IntroPage2(),
      ),
      GetPage(
        name: '/home_page',
        page: () => const HomePage(),
      ),
      GetPage(
        name: '/details_page',
        page: () => const DetailsPage(),
      ),
      GetPage(
        name: '/home_component',
        page: () => const HomeComponent(),
      ),
      GetPage(
        name: '/quotes_component',
        page: () => const QuotesComponent(),
      ),
      GetPage(
        name: '/add_component',
        page: () => const AddComponent(),
      ),
      GetPage(
        name: '/library_component',
        page: () => const LibraryComponent(),
      ),
      GetPage(
        name: '/menu_component',
        page: () => const MenuComponent(),
      ),
      GetPage(
        name: '/favourite_page',
        page: () => const FavouritePage(),
      ),
      GetPage(
        name: '/creations_page',
        page: () => const CreationsPage(),
      ),
      GetPage(
        name: '/privacy_policy',
        page: () => const PrivacyPolicy(),
      ),
    ],
  ));
}
