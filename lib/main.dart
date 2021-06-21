
import 'package:covid_info/pages/choose_country.dart';
import 'package:covid_info/pages/home_page.dart';
import 'package:covid_info/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/":(context)=>Loading(),
    "/home":(context)=>Home(),
    "data":(context)=>Choose(),
  },
));
}
