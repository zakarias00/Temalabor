
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/adapter/SportAdapter.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:get_fit/datas/Activity.dart';
import 'package:get_fit/datas/Goal.dart';
import 'package:get_fit/datas/Sport.dart';
import 'package:get_fit/datas/User.dart';

import '../main.dart';

late List<User> users;
late List<Activity> activities;
late List<Goal> goals;
late List<Sport> sports;
TextEditingController passwordcontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Login', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30)),

                const SizedBox(height: 50),
                Row(
                    children: <Widget>[
                      Text('E-mail ',
                        textAlign: TextAlign.left,
                      ),
                      Flexible(
                        child: TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                      )
                    ]
                ),
                Row(
                    children: <Widget>[
                      Text("Password ",
                        textAlign: TextAlign.left,
                      ),
                      Flexible(
                        child: TextField(
                          obscureText: true,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',

                          ),
                        ),
                      )
                    ]
                ),
                TextButton(
                  onPressed: () async {
                    bool valid = await validateLogin();
                    if (valid  == true) {
                      user = await validatedUser();
                      users = await getUsers();
                    activities = await getActivityByUserId(user.Id);
                      sports = await getSports();
                     goals = await getGoalByUserId(user.Id);

                      print(user.Username);
                      Navigator.pushNamed(
                        context,
                        "/homepage",
                      );
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Not a valid data')),
                      );
                    }
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 20)),
                ),
                const Text('-Or-'),
                TextButton(onPressed: () async {
                  Navigator.pushNamed(
                      context,
                      "/registerpage");
                },
                    child: const Text(
                        'Register', style: TextStyle(fontSize: 20))),

              ]
          ),
        )
    );
  }

  Future<bool> validateLogin() async {
    List<User> users = await getUsers();
    bool find = false;
    users.forEach((element) async {
      if (element.Email == emailcontroller.text
          && element.Password == passwordcontroller.text) {
        find = true;
        user =  await getUserById(element.Id);
      }
    });


    if (find == true) {
      return true;
    }
    return false;
  }


  Future<User> validatedUser() async {
    List<User> users = await getUsers();
    users.forEach((element) async {
      if (element.Email == emailcontroller.text
          && element.Password == passwordcontroller.text) {
        user =  await getUserById(element.Id);
      }
    });

    return user;
  }
}
