import 'dart:convert';

import 'package:http/http.dart';

import 'constants/country.dart';

class Country{
  String cases;
  String todayCase;
  String deaths;
  String todayDeaths;
  String recovered;
  String todayRecovered;
  String active;
  Country({this.cases,this.todayCase,this.deaths,this.todayDeaths,this.recovered,this.todayRecovered,this.active});

  Future<void> getData(index) async {
    String country = countries[index].name;
    try{
      Response response=await get("https://corona.lmao.ninja/v2/countries/$country?yesterday&strict&query%20");
      Map data=jsonDecode(response.body);

    }
    catch(e){
      String data ="COULD NOT GET COUNTRY DATA";
    }
  }
}