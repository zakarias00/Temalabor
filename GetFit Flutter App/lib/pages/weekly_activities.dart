import 'package:flutter/material.dart';
import 'package:get_fit/widgets/MyDate.dart';
import 'package:percent_indicator/percent_indicator.dart';


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Text("Weekly activities", style: TextStyle(fontSize: 20)),
          Text("Select a week ", style: TextStyle(fontSize: 20)),
          Container(
            child: MyDate(),
          ),
          Text("Your goal:"),
          // TODO elosztani a teljesitett celt az egesz cellal, kiiratni
          LinearPercentIndicator(
            width: 400,
            lineHeight: 17.0,
            percent: 0.75,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
            center: Text( "75%"),
          ),
          Text(" 3/4 active days completed"),

          //TODO Felugro ablak, cel valtoztatasa, majd elkuldes
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
              //TODO lefutott km-ek szama megjelenites
              ]
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Time of sport activitties:',
                  textAlign: TextAlign.left,
                ),
                Text('3 hours', textAlign: TextAlign.left,)
                // TODO aktiv orak szama megjelenites
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Burned calories:',
                  textAlign: TextAlign.left,
                ),
                Text('156 kcal', textAlign: TextAlign.left,)
                // TODO osszes egetett kaloria megjelenites
              ]
          ),
        ],
      ),
    );
  }
}
