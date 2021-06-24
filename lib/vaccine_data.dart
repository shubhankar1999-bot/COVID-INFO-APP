import 'dart:convert';

import 'package:http/http.dart';

class VacData{
  List<String> name=[];
  List<String> address=[];
  List<String> district=[];
  List<String> stat=[];
  List<String> feeType=[];
  List<String> availability=[];
  List<String> fee=[];
  List<String> minAgeLimit=[];
  List<String> vaccine=[];
  List slots = [];
  List<String> from=[];
  List<String> to=[];
  List<double> loc=[];

  Future<void> getVaccineData(String pin, String dat) async {
    print(pin);
    print(dat);
    try {
      Response response = await get("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pin&date=$dat");
      Map data1 = jsonDecode(response.body);
      //print(data1);
      List data = data1["sessions"];
      data.forEach((value) {
        //print(value);
        name.add((value["name"]).toString());
        //print(value["name"]);
        address.add((value["address"]).toString());
        //print(value["address"]);
        district.add((value["district_name"]).toString());
        stat.add((value["state_name"]).toString());
        feeType.add((value["fee_type"]).toString());
        fee.add((value["fee"]).toString());
        availability.add((value["available_capacity"]).toString());
        minAgeLimit.add((value["min_age_limit"]).toString());
        vaccine.add((value["vaccine"]).toString());
        from.add((value["from"]).toString());
        to.add((value["to"]).toString());
        slots.add((value["slots"]).toString());
        loc.add((value["lat"]).toDouble());
        loc.add((value["long"]).toDouble());
      });
    }
    catch(e){
      //print(e);
      name.add("COULD NOT FIND DATA");
    }
  }
}