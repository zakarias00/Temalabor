
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/pages/add_activity.dart';
import '../main.dart';
import 'login_screen.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

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

  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {

    String selectedsport = "";
    late List<String> sportnames = [];
    sports.forEach((element) {
      sportnames.add(element.Type);
    });

    initState() async{
      activities = await getActivities();
    }
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget> [
            const Text("History", style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      },
                    )
                ),
                TextButton(onPressed: (){}, child: Text("Search"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(getSportType(activities[index].SportId)),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(activities[index].Time.toString() + " sec "),
                          Text(activities[index].Kcal.toString() + " kcal "),
                          Text(activities[index].Distance.toString() + " km "),

                        ],
                      )
                  );
                },
              ),
            ),
          CupertinoButton(
          onPressed: () {

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddActivity())
            );
              }, child: Text("Add activity"),
      ),
          ]
      ),
    );
  }
}


String getSportType(int i){
  String type = "Egyeb";
  sports.forEach((element)  {
    if ( element.Id == i) {
      type = element.Type;
    }

  });
  return type;
}

