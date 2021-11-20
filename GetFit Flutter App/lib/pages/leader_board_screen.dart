
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import '../main.dart';
import 'login_screen.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

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
  TextEditingController namecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget> [
            SizedBox(height:50),
        const Text("Leader Board", style: TextStyle(fontSize: 25)),
         SizedBox(height:20),
         TextField(
          controller: namecontroller,
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
          icon: Icon(Icons.search)
            //TODO kereses nev alapjan

      ),),
        TextButton(onPressed: () {
          setState(() async{
            //users = await getUserByName(namecontroller.text.toString());
          });

        }, child: Text("Search")),
        Expanded(
          child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index].Username),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(users[index].Level.toString() + "lvl"),
                  Text(users[index].Points.toString()+ "points")
                ],
              )
            );
          },
      ),
        ),
            //TODO visszajott adatok megjelenitese pontok alapjan
  ]
    ),
    );
  }
}


