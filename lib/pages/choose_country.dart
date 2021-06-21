import 'dart:convert';

import 'package:covid_info/constants/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  Future<void> getData(index) async {
    String country = countries[index].name;
    try{
      Response response=await get("https://corona.lmao.ninja/v2/countries/$country?yesterday&strict&query%20");
      Map data=jsonDecode(response.body);

    }
    catch(e){
      time="COULD NOT GET COUNTRY DATA";
    }
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
              getData(index);
            },
            title: Text(countries[index].name),
          ),
        ),
      );
    }),
    );}
}
