import 'package:flutter/material.dart';
import 'package:get_fit/adapter/activity_adapter.dart';
import 'package:get_fit/adapter/goal_adapter.dart';
import 'package:get_fit/widgets/my_date.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import '../main.dart';

var activityadapter2 = ActivityAdapter();
var goaladapter = GoalAdapter();
var selecteddate = SelectedDate();

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

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
                child: const Text('Ok'),
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
    selecteddate = context.read<SelectedDate>();
    goaladapter = context.read<GoalAdapter>();
    activityadapter2.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
    activityadapter2 = context.read<ActivityAdapter>();
    goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
    super.initState();
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
              const Text("Weekly activities", style: TextStyle(fontSize: 25)),
              const Text("Select a week ", style: TextStyle(fontSize: 15)),
              const MyDate(),
              const Text("Your goal:"),
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
                child: const Text("Set goal"),
                onPressed: () {
                  setDialog(context, "Choose active day number: ")
                      .then((onValue) {
                      if (goaladapter.goals.isNotEmpty || goaladapter.goals[0].Amount == 0) {
                        setState(() {
                          if(int.parse(onValue) <= 7){
                            goaladapter.goals[0].Amount = int.parse(onValue);
                            goaladapter.updateGoal(goaladapter.goals[0], goaladapter.goals[0].Id);
                            goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
                          }
                        });
                      }
                  });
                },
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
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
                  ]),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
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
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
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
  activityadapter2.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter2.activities.forEach((element) {
    sum += element.Kcal!;
  });
  return sum;
}

double SumTime() {
  double sum = 0;
  activityadapter2.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter2.activities.forEach((element) {
    sum += element.Time!;
  });
  return sum;
}

double SumDistance() {
  double sum = 0;
  activityadapter2.getActivityByDate(selecteddate.selectedDate.millisecondsSinceEpoch, user.Id);
  activityadapter2.activities.forEach((element) {
    sum += element.Distance;
  });
  return sum;
}

String curramIsNull() {
 goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.isEmpty) return "0";
  return goaladapter.goals[0].CurrentAmount.toString();
}

String amIsNull() {
 goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.isEmpty) return "0";
  return goaladapter.goals[0].Amount.toString().toString();
}

String checkisNull() {
  goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.isEmpty) {
    return "0";
  }
  if(((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount).toDouble() * 100) > 100){
    return "100";
  }
  return ((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount).toDouble() * 100).roundToDouble().toString();
}

double percentIsNull() {
  goaladapter.getGoalByDate(selecteddate.selectedDate.millisecondsSinceEpoch,user.Id);
  if (goaladapter.goals.isEmpty) return 0;
  if((goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount) > 1) return 1.0;
  return goaladapter.goals[0].CurrentAmount / goaladapter.goals[0].Amount;
}
