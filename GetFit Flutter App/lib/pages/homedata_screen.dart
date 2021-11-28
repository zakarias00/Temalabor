import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/src/provider.dart';

import '../main.dart';
import 'login_screen.dart';

class HomeData extends StatelessWidget {
  const HomeData({Key? key}) : super(key: key);

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

var percent = 100;
var useradapter = UserAdapter();

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final DateFormat formatter = DateFormat('yyyy-MM-dd');


  @override
  Widget build(BuildContext context) {


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
              SizedBox(height:10),
              Text(user.Name, style: TextStyle(fontSize: 25)),
              Text(user.Level.toString() + " level"),

              CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 5.0,
                animation: true,
                percent: (percent/100),
                // TODO felhasznalo szintlepesnel hany szazaleknal tart
                center: Text(percent.toString() + " %"),
                progressColor: Colors.blueAccent,
              ),
              //TODO szazalek alapjan uzenet
              Text(motivationMessage(),
                  style: const TextStyle(fontSize: 30),textAlign: TextAlign.center),
              const Text("Your current status: "),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Weight:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      user.Weight.toString() + " kg",
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      child: const Text("SET"),
                      onPressed: () {
                        setDialog(context, "Add Weight: ").then((onValue) {
                          setState(() {
                            if (onValue != "") {
                              user.Weight = double.parse(onValue);
                              useradapter.updateUser(user, user.Id);
                            }
                          });
                        });
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Height:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      user.Height.toString() + " cm",
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      child: const Text("SET"),
                      onPressed: () {
                        setDialog(context, "Add Height: ").then((onValue) {
                          setState(() {
                            if (onValue != "") {
                              user.Height = double.parse(onValue);
                              useradapter.updateUser(user, user.Id);
                            }
                          });
                        });
                      },
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Birthday:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      formatter.format(DateTime.fromMillisecondsSinceEpoch(user.Birthdate)).toString(),
                      textAlign: TextAlign.left,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Gender:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      Gender(),
                      textAlign: TextAlign.left,
                    ),
                  ]),

              ElevatedButton(
                child: const Text("Log out"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String Gender(){
  if(user.Gender == true){
    return "Woman";
  } else {
    return "Man";
  }
}

String motivationMessage(){

  if ( percent <= 25){
    return "Good start, keep going";
  }
  else if( percent <= 50 && percent > 25){
    return "You are halfway there!";
  }
  else if( percent <= 75 && percent > 50){
    return "You are almost there!";
  }
  else if( percent <= 99 && percent > 75){
    return "Last effort to reach your goal!";
  }
  else{
    return "You reached your goal. Well Done!";
  }

}