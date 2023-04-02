/// 4:26:41 tcp etc https://www.youtube.com/watch?v=j-LOab_PzzU&t=16006s

import 'package:firstapp/Pages/login_Page.dart';
import 'package:firstapp/StateFull.dart';
import 'package:firstapp/Pages/home_page.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        // "/home": (context) => HomePage(),
        // "/login": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}

// 4;59;30 AFTER REMOVE GRID
