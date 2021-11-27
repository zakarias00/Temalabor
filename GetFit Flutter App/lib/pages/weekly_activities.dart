import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/datas/Activity.dart';
import 'package:get_fit/pages/homedata_screen.dart';
import 'package:get_fit/widgets/MyDate.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../main.dart';
import 'login_screen.dart';


var activityadapter = ActivityAdapter();

// TODO datum kuldes es ahhoz a hethez jon vissza az adat
class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  setDialog(BuildContext context, String text){

    TextEditingController controller = new TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title:Text(text),
        content: TextField(
          controller: controller,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Ok'),
            onPressed: (){
              Navigator.of(context).pop(controller.text);
            },
          )
        ],
      );
    });
  }

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Text("Weekly activities", style: TextStyle(fontSize: 25)),
              Text("Select a week ", style: TextStyle(fontSize: 15)),
              Container(
                child: MyDate(),
              ),
              Text("Your goal:"),
              // TODO elosztani a teljesitett celt az egesz cellal, kiiratni
              LinearPercentIndicator(
                width: 400,
                lineHeight: 17.0,
                percent: (percentIsNull()),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                center: Text(checkisNull()+ "%"),
              ),
              Text(curramIsNull() + '/' + amIsNull() + " active days completed"),

              //TODO Felugro ablak, cel valtoztatasa, majd elkuldess
              ElevatedButton(
                child: const Text("Change goal"),
                onPressed: () {
                  setDialog(context, "Choose active day number: ").then((onValue){
                    setState(() {
                      if( goals.length != 0){
                        goals[0].Amount = int.parse(onValue);
                        updateGoal(goals[0],goals[0].Id);
                      }
                    });
                  });
                },

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Distance of running:',
                      textAlign: TextAlign.left,
                    ),
                    Text(SumDistance().toString() + 'km', textAlign: TextAlign.left,)
                  //TODO lefutott km-ek szama megjelenites
                  ]
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Time of sport activitties:',
                      textAlign: TextAlign.left,
                    ),
                    Text(SumTime().toString() + 'seconds', textAlign: TextAlign.left,)
                    // TODO aktiv orak szama megjelenites
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    Text('Burned calories:',
                      textAlign: TextAlign.left,
                    ),
                    Text(SumKcal().toString() + ' kcal', textAlign: TextAlign.left,)
                    // TODO osszes egetett kaloria megjelenites
                  ]
              ),
            ],
          ),
        ),
      ],
    );
  }
}

double SumKcal(){
  double sum = 0;
  activityadapter.activities.forEach((element)  {
    sum += element.Kcal!;
  });
  return sum;
}

double SumTime(){
  double sum = 0;
  activityadapter.activities.forEach((element)  {
    sum += element.Time!;
  });
  return sum;
}

double SumDistance(){
  double sum = 0;
 activityadapter.activities.forEach((element)  {
    sum += element.Distance;
  });
  return sum;
}

String curramIsNull(){
  if(goals.length == 0)
    return "0";
  return goals[0].CurrentAmount.toString();

}

String amIsNull(){
  if(goals.length == 0)
    return "0";
  return goals[0].Amount.toString().toString();
}