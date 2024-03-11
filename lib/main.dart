import 'package:flutter/material.dart';
import 'package:news_app/News/News_details.dart';
import 'package:news_app/category/category_details_screen.dart';
import 'package:news_app/home/Home.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:news_app/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => appProvider(), child: MyappNews()));
}

class MyappNews extends StatelessWidget {
  late appProvider provider;

  MyappNews({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appProvider>(context);
    initialSharedPref();
    return MaterialApp(
      routes: {
        home.routeName: (context) => home(),
        settingsTab.routeName: (context) => settingsTab(),
        categoryDetails.routeName: (context) => categoryDetails(),
        newsDetails.routeName: (context) => newsDetails(),
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

  void initialSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String newLanguage = prefs.getString('newLanguage') ?? 'en';
    provider.changeLanguage(newLanguage);
  }
}
