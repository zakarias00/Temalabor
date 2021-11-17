import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/adapter/SportAdapter.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:get_fit/datas/Activity.dart';
import 'package:get_fit/datas/Goal.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:get_fit/widgets/MyDate.dart';

import '../main.dart';

TextEditingController gendercontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController distancecontroller = TextEditingController();
TextEditingController timecontroller = TextEditingController();

class AddActivity extends StatelessWidget{
  const AddActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedsport = "";

    late List<String> sportnames = [];
    sports.forEach((element) {
     sportnames.add(element.Type);
    });

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Text("Choose sport"),
                    Container(
                      child: DropdownButton<String>(
                        items: sportnames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          selectedsport = newvalue!;
                        },
                      )
                    )
                  ]
              ),
              Row(
                  children: <Widget>[
                    Text("Date:"),
                    Container(
                      child: MyDate(),
                    )
                  ]
              ),
              Row(
                  children: <Widget>[
                    Text('Distance(km): ',
                      textAlign: TextAlign.left,
                    ),
                    Flexible(
                        child: TextField(
                            controller: distancecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Distance',
                            ),
                            keyboardType: TextInputType.number
                        )
                    )
                  ]
              ),
              Row(
                  children: <Widget>[
                    Text('Time (sec):',
                      textAlign: TextAlign.left,
                    ),
                    Flexible(
                      child: TextField(
                          controller: timecontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Time',
                          ),
                          keyboardType: TextInputType.number
                      ),
                    )
                  ]
              ),
              TextButton(
                onPressed: () async{
                  Random random = new Random();
                  int randomNumber = random.nextInt(100);

                  Activity newac = Activity(randomNumber,0, user.Id, 0, "", 0,0);
                  sports.forEach((element) {
                    if ( element.Type == selectedsport){
                      newac.SportId = element.Id;
                      newac.Kcal = element.Kcal;
                    }
                  });
                  newac.Time = double.parse(timecontroller.text);
                  newac.Distance = double.parse(distancecontroller.text);
                  newActiviy(newac);
                  print(user.Id);
                  //TODO activiyk lekerdezese jo legyen
                  activities = await getActivityByUserId(user.Id);
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
              ),
              /* ElevatedButton(
              child: const Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),*/
            ],
          )
      ),
    );
  }
}

