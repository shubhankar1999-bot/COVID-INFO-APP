
import 'package:covid_info/constants/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:covid_info/country_data.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  void countryData(index) async {
    Country instance;
    String country = countries[index].name;
    await instance.getData(index);
    Navigator.pop(context,{
      "cases": instance.cases,
      "todayCases": instance.todayCase,
      "deaths": instance.deaths,
      "todayDeaths": instance.todayDeaths,
      "recovered": instance.recovered,
      "todayRecovered": instance.todayRecovered,
      "active": instance.active,
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
    body: ListView.builder(itemCount: countries.length,itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
        child: Card(
          child: ListTile(
            onTap: () {
              countryData(index);
            },
            title: Text(countries[index].name),
          ),
        ),
      );
    }),
    );}
}
