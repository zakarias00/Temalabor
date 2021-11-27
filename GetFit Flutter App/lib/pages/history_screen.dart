
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/pages/add_activity.dart';
import 'package:provider/provider.dart';
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
  var activityadapter = ActivityAdapter();
  var txt = TextEditingController();

  @override
  void initState() {
    super.initState();
    activityadapter = context.read<ActivityAdapter>();
    activityadapter.getActivityByUserId(user.Id);
  }

  @override
  Widget build(BuildContext context) {


    late List<String> sportnames = [];
    sports.forEach((element) {
      sportnames.add(element.Type);
    });

    String selectedsport = sportnames[0];

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget> [
            SizedBox(height:50),
            const Text("History", style: TextStyle(fontSize: 25)),
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
                      onChanged: (String? newvalue) {
                        selectedsport = newvalue!;
                        setState(() {
                         selectedsport;
                         txt.text = selectedsport;
                        });

                        //activityadapter.getActivityBySportId(getSportId(selectedsport));
                      },
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                    )
                ),
                Container(
                  width: 70,
                  child: TextField(
                    controller: txt,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none)
                  ),
                ),
                TextButton(onPressed: (){
                  activityadapter.getActivityByUserId(user.Id);
                  txt.text = "All";
                }, child: Text("All"))
              ],
            ),
            Expanded(
              child: Consumer<ActivityAdapter>(
                builder: (context, activityadapter, child) => ListView.builder(
                  itemCount: activityadapter.activities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(getSportType(activityadapter.activities[index].SportId)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(activityadapter.activities[index].Time.toString() + " sec "),
                            Text(activityadapter.activities[index].Kcal.toString() + " kcal "),
                            Text(activityadapter.activities[index].Distance.toString() + " km "),

                          ],
                        )
                    );
                  },
                ),
              ),
            ),
          CupertinoButton(
          onPressed: ()  {

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddActivity())
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

int getSportId ( String type){
  int id = 0 ;
  sports.forEach((element)  {
    if ( element.Type == type) {
      id = element.Id;
    }

  });
  return id;
}

