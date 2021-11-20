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

//TODO idk letrehozasa
// TODO letrehozott felhasznalohoz hozzaadni ezeket az adatokat, hibauzenet ha nem jo formatumu adat
TextEditingController gendercontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController heightcontroller = TextEditingController();
TextEditingController weightcontroller = TextEditingController();

class PersonalDataScreen extends StatelessWidget{
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Enter your personal datas',textAlign: TextAlign.center, style: TextStyle( fontSize:  30),),
            const SizedBox(height: 50),
            Text("Choose your gender: "),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  Flexible(
                    child: CupertinoButton(
                      onPressed: () {
                              showCupertinoModalPopup<void>(
                              context: context,
                              builder: (BuildContext context) => CupertinoActionSheet(
                                        title: const Text('Gender'),
                                        actions: <CupertinoActionSheetAction>[
                                        CupertinoActionSheetAction(
                                              child: const Text('Woman'),
                                              onPressed: () {
                                              Navigator.pop(context);
                                              user.Gender = true;
                                              },
                                              ),
                                        CupertinoActionSheetAction(
                                              child: const Text('Man'),
                                              onPressed: () {
                                              Navigator.pop(context);
                                              user.Gender = false;
                                    },
                                    )
                                    ],
                                    ),
                          );
                            },
                      child: const Text('Choose Gender'),
                    ),
                  ),
                ]
                    ),

            Column(
              children: <Widget>[
                Text("Choose your birthdate:"),
                Container(
                  child: MyDate(),
                )
// todo regebbrol is lehessen adatot valasztani
              ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Height(cm): ',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: heightcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height',
                      ),
                        keyboardType: TextInputType.number
                    )
                  ),
                  SizedBox(width: 10),
                ]
            ),

           const SizedBox(height: 10),

            Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Weight (kg):',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: weightcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                        keyboardType: TextInputType.number
                    ),
                  ),
                  SizedBox(width: 10),
                ]
            ),
            TextButton(
              onPressed: () async {
                user.Birthdate = datecontroller.text;
                user.Height = double.parse(heightcontroller.text);
                user.Weight = double.parse(weightcontroller.text);
                Random random = new Random();
                int randomNumber = random.nextInt(100);
                user.Id = randomNumber;
                newUser(user);

                Navigator.pushNamed(
                  context,
                  "/loginpage",
                );
              },
              child: const Text("Submit"),
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

