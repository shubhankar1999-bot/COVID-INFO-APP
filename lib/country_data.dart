import 'dart:convert';

import 'package:http/http.dart';


class Country{
  String cases="a";
  String todayCase="b";
  String deaths="c";
  String todayDeaths="d";
  String recovered="e";
  String todayRecovered="f";
  String active="g";
  String flag="h";

  Future<void> getData(String country) async {
    try{
      Response response=await get("https://corona.lmao.ninja/v2/countries/$country?yesterday&strict&query%20");
      Map data=jsonDecode(response.body);
      cases=(data["cases"]).toString();
      todayCase=(data["todayCases"]).toString();
      print(todayCase);
      deaths=(data["deaths"]).toString();
      todayDeaths=(data["todayDeaths"]).toString();
      recovered=(data["recovered"]).toString();
      todayRecovered=(data["todayRecovered"]).toString();
      active=(data["active"]).toString();
      flag = ((data["countryInfo"])["flag"]).toString();
      print(flag);
    }
    catch(e){
     cases="COULD NOT GET CASES RELATED TO THIS COUNTRY";
    }
  }
}