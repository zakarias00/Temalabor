import 'package:flutter/material.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:provider/provider.dart';
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

  var useradapter = UserAdapter();

  @override
  void initState() {
    super.initState();
    useradapter = context.read<UserAdapter>();
    useradapter.getUsers();
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 50),
                const Text("Leader Board", style: TextStyle(fontSize: 25)),
                SizedBox(height: 30),
                SizedBox(
                  width: 350,
                  child: TextField(
                    onChanged: (text) {
                      useradapter.getUserByName(text);
                    },
                    controller: namecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        contentPadding: const EdgeInsets.all(10.0),
                        icon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  child: Consumer<UserAdapter>(
                    builder: (context, useradapter, child) => ListView.builder(
                      itemCount: useradapter.users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(useradapter.users[index].Username),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(useradapter.users[index].Level.toString() +
                                    "lvl"),
                                Text(
                                    useradapter.users[index].Points.toString() +
                                        "points")
                              ],
                            ));
                      },
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
