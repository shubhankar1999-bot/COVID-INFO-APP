
import 'package:covid_info/pages/choose_country.dart';
import 'package:covid_info/pages/choose_places.dart';
import 'package:covid_info/pages/dashboard.dart';
import 'package:covid_info/pages/display_hospital.dart';
import 'package:covid_info/pages/display_map.dart';
import 'package:covid_info/pages/home_page.dart';
import 'package:covid_info/pages/mapLocation.dart';
import 'package:covid_info/pages/splash_screen.dart';
import 'package:covid_info/pages/vaccine_check.dart';
import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/":(context)=>Loading(),
    "/home":(context)=>Home(),
    "/data":(context)=>Choose(),
    "/dashboard":(context)=>Dashboard(),
    "/vaccineLogin":(context)=>CheckVaccine(),
    "/mapLocation":(context)=>MapData(),
    "/mapDisplay":(context)=>DisplayMap(),
    "/hospitalPlace":(context)=>PlacesHospital(),
    "/hospitalDisplay":(context)=>DisplayHospital(),
  },
));

