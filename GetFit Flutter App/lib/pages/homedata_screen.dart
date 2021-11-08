import 'package:flutter/material.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeData extends StatelessWidget {
  const HomeData({Key? key}) : super(key: key);

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
          Text(user.username, style: TextStyle(fontSize: 20)),
          Text("level 1"),

           CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 5.0,
            percent: 1.0,
            center: Text("100%"),
            progressColor: Colors.blueAccent,
          ),

          Text("Keep going, you are almost there!",style:  TextStyle(fontSize: 30)),
        Text("Your current status: "),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Weight:',
                  textAlign: TextAlign.left,
                ),
              Text(user.weight.toString() + " kg", textAlign: TextAlign.left,)

              ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                Text('Height:',
                  textAlign: TextAlign.left,
                ),
                Text(user.height.toString() + " cm", textAlign: TextAlign.left,)
              ]
          ),


        ElevatedButton(
         child: const Text("Log out"),
             onPressed: () {
             },

        ),
        ],
      ),
    );
  }
}
