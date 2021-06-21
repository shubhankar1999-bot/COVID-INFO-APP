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

  Future<void> getData(country) async {
    List<String> country_data;
    try{
      Response response=await get("https://corona.lmao.ninja/v2/countries/$country?yesterday&strict&query%20");
      Map data=jsonDecode(response.body);
      cases=data["cases"];
      todayCase=data["todayCases"];
      deaths=data["deaths"];
      todayDeaths=data["todayDeaths"];
      recovered=data["recovered"];
      todayRecovered=data["todayRecovered"];
      active=data["active"];
    }
    catch(e){
     cases="COULD NOT GET CASES RELATED TO THIS COUNTRY";
    }
  }
}