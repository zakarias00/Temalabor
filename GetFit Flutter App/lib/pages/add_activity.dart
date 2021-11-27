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

    return Stack(
      children: [
        Image.asset(
          "assets/images/back.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Row(
                      children: <Widget>[
                        SizedBox(width:10),
                        Text("Choose sport"),
                        SizedBox(width:10),
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
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: Colors.blue,
                            ),
                          )
                        ),
                        SizedBox(width:10),
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
                  SizedBox(height:10),

                  Row(
                      children: <Widget>[
                        SizedBox(width:10),
                        Text("Date:"),
                        SizedBox(width:10),
                        Container(
                          child: MyDate(),
                        )
                      ]
                  ),
                  SizedBox(height:10),
                  Row(
                      children: <Widget>[
                        SizedBox(width:10),
                        Text('Distance(km): ',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width:10),
                        Flexible(
                            child: TextField(
                                controller: distancecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Distance',
                                ),
                                keyboardType: TextInputType.number
                            )
                        ),
                        SizedBox(width:10),
                      ]
                  ),
                  SizedBox(height:10),
                  Row(
                      children: <Widget>[
                        SizedBox(width:10),
                        Text('Time (sec):',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width:10),
                        Flexible(
                          child: TextField(
                              controller: timecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Time',
                              ),
                              keyboardType: TextInputType.number
                          ),
                        ),
                        SizedBox(width:10),
                      ]
                  ),
                  SizedBox(height:10),
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
                        onPressed: () async{

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
                            await activityadapter.newActiviy(newac);

                            await activityadapter.getActivityByUserId(user.Id);
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
        ),
      ],
    );
  }
}

