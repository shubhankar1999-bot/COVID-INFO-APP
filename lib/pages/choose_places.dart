import 'package:covid_info/constants/state_url.dart';
import 'package:covid_info/constants/states.dart';
import 'package:covid_info/hospital_data.dart';
import 'package:flutter/material.dart';

class PlacesHospital extends StatefulWidget {
  @override
  _PlacesHospitalState createState() => _PlacesHospitalState();
}

class _PlacesHospitalState extends State<PlacesHospital> {
  void placeHospitalData(String url2) async{
    HospiData instance  = new HospiData();
    await instance.getHospitalData(url2);
    Navigator.pushNamed(context, "/hospitalDisplay", arguments: {
      "hospName":instance.hospName,
      "address":instance.address,
      "district":instance.district,
      "contact":instance.contact,
      "type":instance.type,
      "total":instance.total,
      "vacant":instance.vacant,
      "covidBedsRegula":instance.covidBedsRegular,
      "covidBedsVacant":instance.covidBedsVacant,
      "covidBedsOxygenTotal":instance.covidBedsOxygenTotal,
      "covidBedsOxygenVacant":instance.covidBedsOxygenVacant,
      "hduBedsRegular":instance.hduBedsRegular,
      "hduBedsVacant":instance.hduBedsVacant,
      "hasIcuBeds":instance.hasIcuBeds,
      "hasVantilators":instance.hasVantilators,
      "isNewHospital":instance.isNewHospital,
      "ccuBedsWithVantilatorTotal":instance.ccuBedsWithVantilatorTotal,
      "ccuBedsWithVantilatorVacant":instance.ccuBedsWithVantilatorVacant,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: state.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                print(url3[index].url);
                placeHospitalData(url3[index].url.toString());
              },
              title: Text(state[index].name),
            ),
          ),
        );
      }),
    );
  }
}
