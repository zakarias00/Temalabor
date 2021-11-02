import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Text("Weekly activities", style: TextStyle(fontSize: 20)),
          Text("Your goal:"),
          LinearPercentIndicator(
            width: 420,
            lineHeight: 17.0,
            percent: 0.75,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
            center: Text( "75%"),
          ),
          Text(" 3/4 active days completed"),

          ElevatedButton(
            child: const Text("Change goal"),
            onPressed: () {
            },

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Distance of running:',
                  textAlign: TextAlign.left,
                ),
                Text('20 kilometers', textAlign: TextAlign.left,)

              ]
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Time of sport activitties>',
                  textAlign: TextAlign.left,
                ),
                Text('3 hours', textAlign: TextAlign.left,)
              ]
          ),
        ],
      ),
    );
  }
}
