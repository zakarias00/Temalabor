
import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget> [
        const Text("Leader Board", style: TextStyle(fontSize: 30)),
        const TextField(decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
          icon: Icon(Icons.search)
            //TODO kereses nev alapjan
      ),),
        Expanded(
          child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index].Name),
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


