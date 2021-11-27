import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/datas/Activity.dart';
import 'package:get_fit/pages/personal_data_screen.dart';
import 'package:get_fit/widgets/MyDate.dart';
import 'package:provider/src/provider.dart';

import '../main.dart';

TextEditingController gendercontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController distancecontroller = TextEditingController();
TextEditingController timecontroller = TextEditingController();

class AddActivity extends StatelessWidget{
   AddActivity({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String selectedsport = "";

    var activityadapter = context.read<ActivityAdapter>();
    late List<String> sportnames = [];
    sports.forEach((element) {
     sportnames.add(element.Type);
    });

    var txt = TextEditingController();

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
                          txt.text = selectedsport;
                        },
                      )
                    ),
                    Container(
                      width: 70,
                      child: TextField(
                          controller: txt,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none)
                      ),
                    ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text("Back"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: (){

                      if( selectedsport != ""){
                        Random random = new Random();
                        int randomNumber = random.nextInt(100);

                        Activity newac = Activity(randomNumber,0, user.Id, 0, "2021", 0,0);
                        sports.forEach((element) {
                          if ( element.Type == selectedsport){
                            newac.SportId = element.Id;
                            newac.Kcal = element.Kcal;
                          }
                        });
                        newac.Time = double.parse(timecontroller.text);
                        newac.Distance = double.parse(distancecontroller.text);
                        activityadapter.newActiviy(newac);

                        //TODO activiyk lekerdezese jo legyen
                        activityadapter.getActivityByUserId(user.Id);
                        heightcontroller.clear();
                        weightcontroller.clear();
                        Navigator.of(context).pop();
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Choose a sport')),
                        );
                      }

                    },
                    child: const Text("Ok"),
                  ),

                ],
              ),

            ],
          )
      ),
    );
  }
}

