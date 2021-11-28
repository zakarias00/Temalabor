import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/widgets/MyDate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import '../main.dart';

var activityadapter = ActivityAdapter();
var goaladapter = GoalAdapter();
var selecteddate = SelectedDate();

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
  setDialog(BuildContext context, String text) {
    TextEditingController controller = new TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text),
            content: TextField(
              controller: controller,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    selecteddate =context.read<SelectedDate>();
    goaladapter = context.read<GoalAdapter>();
    activityadapter = context.read<ActivityAdapter>();
    goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
    activityadapter.getActivityByDate(DateTime.now().millisecondsSinceEpoch, user.Id);
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
            children: <Widget>[
              Text("Weekly activities", style: TextStyle(fontSize: 25)),
              Text("Select a week ", style: TextStyle(fontSize: 15)),
              Container(
                child: MyDate(),
              ),
              Text("Your goal:"),
              // TODO elosztani a teljesitett celt az egesz cellal, kiiratni
          Consumer<SelectedDate>(
            builder: (context,selecteddate,child){
              return LinearPercentIndicator(
                width: 400,
                lineHeight: 17.0,
                percent: (percentIsNull()),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                center: Text(checkisNull() + "%"),
              );
            }

              ),
              Consumer<SelectedDate>(
                  builder: (context,selecteddate,child){
                    return Text(
                        curramIsNull() + "/" + amIsNull() ,
                    );
                  }
              ),

              ElevatedButton(
                child: const Text("Change goal"),
                onPressed: () {
                  setDialog(context, "Choose active day number: ")
                      .then((onValue) {
                      if (goaladapter.goals.length != 0) {
                        setState(() {
                          goaladapter.goals[0].Amount = int.parse(onValue);
                          goaladapter.updateGoal(goaladapter.goals[0], goaladapter.goals[0].Id);
                          goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
                        });
                      }
                  });
                },
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Distance of running:',
                      textAlign: TextAlign.left,
                    ),
                    Consumer<SelectedDate>(
                      builder: (context,selecteddate,child){
                       return Text(
                        SumDistance().toString() + ' km',
                        textAlign: TextAlign.left,
                         );
                        }
                    )
                    //TODO lefutott km-ek szama megjelenites
                  ]),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Time of sport activitties:',
                      textAlign: TextAlign.left,
                    ),
                    Consumer<SelectedDate>(
                        builder: (context,selecteddate,child){
                          return Text(
                            SumTime().toString() + ' sec',
                            textAlign: TextAlign.left,
                          );
                        }
                    )
                    // TODO aktiv orak szama megjelenites
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Burned calories:',
                      textAlign: TextAlign.left,
                    ),
                    Consumer<SelectedDate>(
                        builder: (context,selecteddate,child){
                          return Text(
                            SumKcal().toString() + ' kcal',
                            textAlign: TextAlign.left,
                          );
                        }
                    )
                    // TODO osszes egetett kaloria megjelenites
                  ]),
            ],
          ),
        ),
      ],
    );
  }
}

double SumKcal()  {
  double sum = 0;
  activityadapter.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter.activities.forEach((element) {
    sum += element.Kcal!;
  });
  print(sum);
  return sum;
}

double SumTime() {
  double sum = 0;
  activityadapter.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter.activities.forEach((element) {
    sum += element.Time!;
  });
  return sum;
}

double SumDistance() {
  double sum = 0;
  activityadapter.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter.activities.forEach((element) {
    sum += element.Distance;
  });
  return sum;
}

String curramIsNull() {
 goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.length == 0) return "0";
  return goaladapter.goals[0].CurrentAmount.toString();
}

String amIsNull() {
 goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.length == 0) return "0";
  return goaladapter.goals[0].Amount.toString().toString();
}

String checkisNull() {
  goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.length == 0) {
    return "0";
  }
  if(((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount).toDouble() * 100) > 100){
    return "100";
  }
  return ((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount).toDouble() * 100).toString();
}

double percentIsNull() {
  goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.length == 0) return 0;
  if((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount) > 1) return 1.0;
  return goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount;
}
