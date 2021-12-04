import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_fit/adapter/activity_adapter.dart';
import 'package:get_fit/datas/activity.dart';
import 'package:get_fit/widgets/my_date.dart';
import 'package:provider/src/provider.dart';
import '../main.dart';

TextEditingController gendercontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController distancecontroller = TextEditingController();
TextEditingController timecontroller = TextEditingController();

class AddActivity extends StatelessWidget {
  const AddActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedsport = "";

    var activityadapter = context.read<ActivityAdapter>();
    late List<String> sportnames = [];
    sports.forEach((element) {
      sportnames.add(element.Type);
    });

    var selecteddate = SelectedDate();
    var txt = TextEditingController();
    selecteddate = context.read<SelectedDate>();
    distancecontroller.clear();
    timecontroller.clear();


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
            children: <Widget>[
              Row(children: <Widget>[
                const SizedBox(width: 10),
                const Text("Choose sport"),
                const SizedBox(width: 10),
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
                )),
                const SizedBox(width: 10),
                Container(
                  width: 120,
                  child: TextField(
                    controller: txt,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Row(children: const <Widget>[
                SizedBox(width: 10),
                Text("Date:"),
                SizedBox(width: 10),
                MyDate()
              ]),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                const SizedBox(width: 10),
                const Text(
                  'Distance(km): ',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Flexible(
                    child: TextField(
                        controller: distancecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Distance',
                        ),
                        keyboardType: TextInputType.number)),
                const SizedBox(width: 10),
              ]),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                const SizedBox(width: 10),
                const Text(
                  'Time (sec):',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                      controller: timecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Time',
                      ),
                      keyboardType: TextInputType.number),
                ),
                const SizedBox(width: 10),
              ]),
              const SizedBox(height: 10),
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
                    onPressed: () async {
                      if (selectedsport != "" &&
                          timecontroller != "Time" &&
                          distancecontroller != "Distance") {
                        Random random = Random();
                        int randomNumber = random.nextInt(100);

                        Activity newac =
                            Activity(randomNumber, 0, user.Id, 0, selecteddate.selectedDate.millisecondsSinceEpoch, 0, 0);
                        sports.forEach((element) {
                          if (element.Type == selectedsport) {
                            newac.SportId = element.Id;
                            newac.Kcal = element.Kcal;
                          }
                        });
                        newac.Time = double.parse(timecontroller.text);
                        newac.Distance = double.parse(distancecontroller.text);

                        await activityadapter.newActiviy(newac);
                        await activityadapter.getActivityByUserId(user.Id);


                        Navigator.of(context).pop();
                      } else {
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
          )),
        ),
      ],
    );
  }
}


