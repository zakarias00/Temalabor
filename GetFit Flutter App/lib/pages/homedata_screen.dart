import 'package:flutter/material.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {


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


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Text(user.Name, style: TextStyle(fontSize: 25)),
          Text(user.Level.toString() + " level"),

           CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 5.0,
            animation: true,
            percent: (percentIsNull()),
            // TODO felhasznalo szintlepesnel hany szazaleknal tart
            center: Text(checkisNull()+ " %"),
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
                      setDialog(context, "Add Weight: ").then((onValue){
                        setState(() {
                          user.Weight = double.parse(onValue);
                          updateUser(user, user.Id);
                        });
                      });
                    },
                )
              ]
          ),
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
                    setDialog(context, "Add Height: ").then((onValue){
                      setState(() {
                        user.Height = double.parse(onValue);
                        updateUser(user, user.Id);
                      });
                       });
                  },
                )
              ]
          ),
      //TODO log out
        ElevatedButton(
         child: const Text("Log out"),
             onPressed: () {
               Navigator.of(context, rootNavigator: true).pop(context);},

        ),
        ],
      ),
    );
  }
}

String checkisNull(){
  if( goals.length == 0){
    return "0";
  }
  return (goals[0].CurrentAmount/goals[0].Amount).toInt().toString();
}

double percentIsNull(){
  if(goals.length == 0)
    return 0;
  return goals[0].CurrentAmount/goals[0].Amount;
}
