import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("COV-INFO",
        style: TextStyle(decorationColor: Colors.white,
        color: Colors.white54,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(onPressed: () async {
      dynamic result=await Navigator.pushNamed(context, "/data");
      setState(() {
      data = {
      "cases": result["cases"],
      "todayCases": result["todayCase"],
      "deaths": result["deaths"],
      "todayDeaths": result["todayDeaths"],
      "recovered": result["recovered"],
      "todayRecovered": result["todayRecovered"],
      "active": result["active"],
      };
      });
      },
          icon: Icon(
            Icons.edit_location,
            color: Colors.blue[700],
          ),
          label: Text(
            "Edit Location",
            style: TextStyle(
                color: Colors.grey[300]
            ),
          )
      ),
            Text(data["cases"],
          style: TextStyle(
            fontSize: 28.0,
            letterSpacing: 2.0,
            color: Colors.black87,)
            )],
        ),
      ),
    );
  }
}
