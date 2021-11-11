import 'package:flutter/material.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../main.dart';


// TODO felhasznalo adatai lekerdezese

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

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Text(user.Name, style: TextStyle(fontSize: 20)),
          Text(user.Level.toString()),

           CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 5.0,
            percent: 1.0,
            // TODO felhasznalo szintlepesnel hany szazaleknal tart
            center: Text("100%"),
            progressColor: Colors.blueAccent,
          ),
        //TODO szazalek alapjan uzenet
          Text("Keep going, you are almost there!",style:  const TextStyle(fontSize: 30)),
        const Text("Your current status: "),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Weight:',
                  textAlign: TextAlign.left,
                ),
              Text(user.Weight.toString() + " kg", textAlign: TextAlign.left,),
                TextButton(
                    child: const Text("SET"),
                    onPressed: (){

                    },
                )
              ]
          ),
        //TODO SET weight, elkuldeni az uj adatokat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                const Text('Height:',
                  textAlign: TextAlign.left,
                ),
                Text(user.Height.toString() + " cm", textAlign: TextAlign.left,),
                TextButton(
                  child: const Text("SET"),
                  onPressed: (){

                  },
                )
              ]
          ),
      //TODO SET height elkuldeni az uj adatokat

        ElevatedButton(
         child: const Text("Log out"),
             onPressed: () {
           // TODO visszalepni a Login kepernyohoz es kilepni
             },

        ),
        ],
      ),
    );
  }
}
