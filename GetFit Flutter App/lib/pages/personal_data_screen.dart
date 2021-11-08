import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:get_fit/widgets/MyDate.dart';

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
                                              user.gender = "Woman";
                                              },
                                              ),
                                        CupertinoActionSheetAction(
                                              child: const Text('Man'),
                                              onPressed: () {
                                              Navigator.pop(context);
                                              user.gender = "Man";
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
                  Text('Height(cm): ',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      controller: heightcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height',
                      ),
                        keyboardType: TextInputType.number
                    )
                  )
                ]
            ),
            Row(
                children: <Widget>[
                  Text('Weight (kg):',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      controller: weightcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                        keyboardType: TextInputType.number
                    ),
                  )
                ]
            ),
            TextButton(
              onPressed: (){
                user.gender = gendercontroller.text;
                user.date = datecontroller.text;
                user.height = double.parse(heightcontroller.text);
                user.weight = double.parse(weightcontroller.text);
                Navigator.pushNamed(
                  context,
                  "/homepage",
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

