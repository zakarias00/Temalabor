
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/SportAdapter.dart';
import 'package:get_fit/datas/Sport.dart';

TextEditingController namecontroller = TextEditingController();
TextEditingController caloriacontroller = TextEditingController();

class AdminActivity extends StatelessWidget{
  const AdminActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text("Add a new sport"),
              Row(
                  children: <Widget>[
                    Text("Add sport name:"),
                    Flexible(
                        child: TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            keyboardType: TextInputType.number
                        )
                    )
                  ]
              ),
              Row(
                  children: <Widget>[
                    Text('Add calories per sec: ',
                      textAlign: TextAlign.left,
                    ),
                    Flexible(
                        child: TextField(
                            controller: caloriacontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Caloria',
                            ),
                            keyboardType: TextInputType.number
                        )
                    )
                  ]
              ),
              TextButton(
                onPressed: () async{
                  Random random = new Random();
                  int randomNumber = random.nextInt(100);

                  Sport newsport = Sport(randomNumber,namecontroller.text,double.parse(caloriacontroller.text));
                  newSport(newsport);

                  print(newsport.Type.toString());
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