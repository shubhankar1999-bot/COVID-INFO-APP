import 'dart:convert';

import 'package:http/http.dart';

class HospiData{
  List<String> hospName=[];
  List<String> address=[];
  List<String> district=[];
  List<String> contact=[];
  List<String> type=[];
  List<String> total=[];
  List<String> vacant=[];
  List<String> covidBedsRegular=[];
  List<String> covidBedsVacant=[];
  List<String> covidBedsOxygenTotal=[];
  List<String> covidBedsOxygenVacant=[];
  List<String> hduBedsRegular=[];
  List<String> hduBedsVacant=[];
  List<String> hasIcuBeds=[];
  List<String> hasVantilators=[];
  List<String> isNewHospital=[];
  List<String> ccuBedsWithVantilatorTotal=[];
  List<String> ccuBedsWithVantilatorVacant=[];
  List<double> lat=[];
  List<double> lon=[];



  Future<void> getHospitalData(String url1) async {
    try {
      Response response = await get(url1);
      if(response.statusCode == 200) {
        List data1 = jsonDecode(response.body);

        data1.forEach((value) {
          hospName.add((value["HOSPITAL_NAME"]).toString());
          address.add((value["ADDRESS"]).toString());
          district.add((value["DISTRICT"]).toString());
          type.add((value["TYPE"]).toString());
          contact.add((value["CONTACT"]).toString());
          total.add((value["TOTAL"]).toString());
          vacant.add((value["VACANT"]).toString());
          covidBedsRegular.add((value["COVID_BEDS_REGULAR_TOTAL"]).toString());
          covidBedsVacant.add((value["COVID_BEDS_REGULAR_VACANT"]).toString());
          covidBedsOxygenTotal.add(
              (value["COVID_BEDS_WITH_OXYGEN_TOTAL"]).toString());
          covidBedsOxygenVacant.add(
              (value["COVID_BEDS_WITH_OXYGEN_VACANT"]).toString());
          hduBedsRegular.add((value["HDU_BEDS_TOTAL"]).toString());
          hduBedsVacant.add((value["HDU_BEDS_VACANT"]).toString());
          ccuBedsWithVantilatorTotal.add(
              (value["CCU_BEDS_WITH_VENTILATOR_TOTAL"]).toString());
          ccuBedsWithVantilatorVacant.add(
              (value["CCU_BEDS_WITH_VENTILATOR_VACANT"]).toString());
          hasVantilators.add((value["HAS_VENTILATORS"]).toString());
          hasIcuBeds.add((value["HAS_ICU_BEDS"]).toString());
          isNewHospital.add((value["IS_NEW_HOSPITAL"]).toString());
        });
      }
    }
    catch(e){
      print(e);
      hospName.add("COULD NOT FETCH");
    }
  }

}