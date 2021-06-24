import 'package:covid_info/pages/vaccine_check.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
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
      body: ListView.builder(itemCount: 3,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
            String s="Default";
            if(index==0){
                s="Covid Details";
            }
            if(index==1){
                s="Check Vaccination Details";
            }
            if(index==2){
              s="CHECK ICU BEDS AND VENTILATORS";
            }
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
             child: InkWell(
              onTap: (){
              if(index==1){
              Navigator.pushNamed(context,"/vaccineLogin");
              }
              if(index==0){
              Navigator.pushNamed(context, "/home",arguments: data);
              }
              if(index==2){
                Navigator.pushNamed(context, "/hospitalPlace");
              }
              },
               child: SizedBox(
                 height: 300,
                 width: MediaQuery.of(context).size.width,
                 child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                    child: Text(
                    "$s",
                    style: TextStyle(fontSize: 32,),
              )
            )
          ),
               ),
        ),
      );
    }),
    );
  }
}
