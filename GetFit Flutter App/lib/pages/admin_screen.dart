import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/sport_adapter.dart';
import 'package:get_fit/datas/sport.dart';

TextEditingController namecontroller = TextEditingController();
TextEditingController caloriacontroller = TextEditingController();

class AdminActivity extends StatelessWidget{
  const AdminActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  const Text("Add a new sport", style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 50),
                  Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        const Text("Add sport name:"),
                        const SizedBox(width: 10),
                        Flexible(
                            child: TextField(
                                controller: namecontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                ),
                                keyboardType: TextInputType.number
                            )
                        ),
                        const SizedBox(width: 10),
                      ]
                  ),
                  const SizedBox(height: 10),
                  Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        const Text('Add calories per sec: ',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                            child: TextField(
                                controller: caloriacontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Caloria',
                                ),
                                keyboardType: TextInputType.number
                            )
                        ),
                        const SizedBox(width: 10),
                      ]
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async{
                      Random random = Random();
                      int randomNumber = random.nextInt(100);

                      Sport newsport = Sport(randomNumber,namecontroller.text,double.parse(caloriacontroller.text));
                      newSport(newsport);

                      namecontroller.clear();
                      caloriacontroller.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Ok", style: TextStyle(fontSize: 20)),
                  ),
                  TextButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
              ),
            ],
              )
          ),
        ),
      ],
    );
  }
}