import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_fri/home/home_screen.dart';
import 'package:flutter_app_news_c9_fri/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}

