
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
              Text("Add a new sport", style: TextStyle(fontSize: 25)),
              SizedBox(height: 50),
              Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text("Add sport name:"),
                    SizedBox(width: 10),
                    Flexible(
                        child: TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                            ),
                            keyboardType: TextInputType.number
                        )
                    ),
                    SizedBox(width: 10),
                  ]
              ),
              SizedBox(height: 10),
              Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text('Add calories per sec: ',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child: TextField(
                            controller: caloriacontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Caloria',
                            ),
                            keyboardType: TextInputType.number
                        )
                    ),
                    SizedBox(width: 10),
                  ]
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () async{
                  Random random = new Random();
                  int randomNumber = random.nextInt(100);

                  Sport newsport = Sport(randomNumber,namecontroller.text,double.parse(caloriacontroller.text));
                  newSport(newsport);

                  print(newsport.Type.toString());
                  Navigator.of(context).pop();
                },
                child: const Text("Ok", style: TextStyle(fontSize: 20)),
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