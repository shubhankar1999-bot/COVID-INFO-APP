import 'package:flutter/material.dart';

class DisplayHospital extends StatefulWidget {
  @override
  _DisplayHospitalState createState() => _DisplayHospitalState();
}

class _DisplayHospitalState extends State<DisplayHospital> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return new Future.value(false);
        },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView.builder(itemCount: data["hospName"].length,itemBuilder: (context,index){
          return Padding(padding: EdgeInsets.all(3.0),
            child: Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data["hospName"][index]),
                    Text(data["type"][index]),
                    Text(data["district"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["address"][index]),
                    Text(data["contact"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["total"][index]),
                    Text(data["vacant"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["covidBedsRegula"][index]),
                    Text(data["covidBedsVacant"][index]),
                    Text(data["covidBedsOxygenTotal"][index]),
                    Text(data["covidBedsOxygenVacant"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["hduBedsRegular"][index]),
                    Text(data["hduBedsVacant"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["hasIcuBeds"][index]),
                    Text(data["hasVantilators"][index]),
                    Text(data["isNewHospital"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Text(data["ccuBedsWithVantilatorTotal"][index]),
                    Text(data["ccuBedsWithVantilatorVacant"][index]),
                    Divider(
                      height: 3,
                      thickness: 3,
                    ),
                    Center(
                      child: FlatButton.icon(onPressed: () async {
                        print(data["loc"][index]);
                        await Navigator.pushNamed(context, "/mapDisplay",arguments: {"loc": data["loc"],"name": data["hospName"][index],"address": data["address"][index],});
                      }, icon: Icon(
                        Icons.edit_location,
                        color: Colors.blue[700],
                      ), label: Text("Find On Map",
                        style: TextStyle(
                            color: Colors.black
                        ),)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
