import 'package:flutter/material.dart';
import 'package:covid_info/vaccine_data.dart';

class CheckVaccine extends StatefulWidget {
  @override
  _CheckVaccineState createState() => _CheckVaccineState();
}

class _CheckVaccineState extends State<CheckVaccine> {
  final myController = TextEditingController(text: "274001");
  final myController2 = TextEditingController(text: "31-05-2021");


  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }
  void setupVaccineData(String pin, String dat) async{
    VacData instance = new VacData();
    await instance.getVaccineData(pin,dat);
    Navigator.pushNamed(context, "/mapLocation",arguments: {
      "name":instance.name,
      "address":instance.address,
      "district_name":instance.district,
      "state_name":instance.stat,
      "feeType": instance.feeType,
      "availability": instance.availability,
      "fee": instance.fee,
      "minAgeLimit": instance.minAgeLimit,
      "vaccine": instance.vaccine,
      "slots": instance.slots,
      "from": instance.from,
      "to": instance.to,
      "loc": instance.loc,
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return new Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: myController,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.edit),
                  labelText: 'Edit Pin',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  helperText: 'Enter Pin code of the area ',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              TextFormField(
                controller: myController2,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 10,
                decoration: InputDecoration(
                  icon: Icon(Icons.date_range_rounded),
                  labelText: 'Edit Date',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  helperText: 'DD-MM-YY',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(onPressed: () async{

                  if(myController.text.toString().isNotEmpty && myController2.text.toString().isNotEmpty){
                    setupVaccineData(myController.text.toString(), myController2.text.toString());
                  }
              },
              child: Icon(Icons.near_me),)
            ],
          ),
        ),
      ),
    );
  }
}
