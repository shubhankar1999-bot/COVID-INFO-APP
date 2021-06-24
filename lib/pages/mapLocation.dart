import 'package:flutter/material.dart';

class MapData extends StatefulWidget {
  @override
  _MapDataState createState() => _MapDataState();
}
class _MapDataState extends State<MapData> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        return new Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView.builder(itemCount: data["name"].length,itemBuilder: (context,index){
          print(index);
          return Padding(padding: EdgeInsets.all(3.0),
              child: Card(
              elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["name"][index]),
                      Text(data["address"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Text(data["district_name"][index]),
                      Text(data["state_name"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Text(data["feeType"][index]),
                      Text(data["fee"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Text(data["availability"][index]),
                      Text(data["minAgeLimit"][index]),
                      Text(data["vaccine"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Text(data["slots"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Text("FROM: "+data["from"][index]+" TO: "+data["to"][index]),
                      Divider(
                        height: 3,
                        thickness: 3,
                      ),
                      Center(
                        child: FlatButton.icon(onPressed: () async {
                            print(data["loc"][index]);
                            await Navigator.pushNamed(context, "/mapDisplay",arguments: {"loc": data["loc"],"name": data["name"][index],"address": data["address"][index],});
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
