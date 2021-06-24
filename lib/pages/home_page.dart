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
    print(data["cases"]);
    print(data["todayCase"]);
    print(data["deaths"]);
    print(data["todayDeaths"]);
    print(data["recovered"]);
    print(data["todayRecovered"]);
    print(data["active"]);
    print(data["flag"]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("COV-INFO",
          style: TextStyle(decorationColor: Colors.white,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: WillPopScope(
        onWillPop: (){
          return new Future.value(true);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(data["flag"]),
                ),
                SizedBox(
                  height: 5,
                ),
                FlatButton.icon(onPressed: () async {
          dynamic result=await Navigator.pushNamed(context, "/data");
          setState(() {
            data = {
              "cases": result["cases"],
              "todayCases": result["todayCases"],
              "deaths": result["deaths"],
              "todayDeaths": result["todayDeaths"],
              "recovered": result["recovered"],
              "todayRecovered": result["todayRecovered"],
              "active": result["active"],
              "flag": result["flag"]
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
                    color: Colors.black
                ),
              )
          ),
                SizedBox(
                  height: 5,
                ),
                Text("TOTAL CASES",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["cases"],
              style: TextStyle(
                fontSize: 28.0,
                letterSpacing: 2.0,
                color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("FRESH CASES",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["todayCases"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("TOTAL DEATHS",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["deaths"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("DEATHS TODAY",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["todayDeaths"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("TOTAL RECOVERED",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["recovered"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("RECOVERED TODAY",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["todayRecovered"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Colors.blue[900],
                ),
                Text("ACTIVE CASES",
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.red[800],)
                ),
                Text(data["active"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.black87,)
                )],
            ),
          ),
        ),
      ),
    );
  }
}
