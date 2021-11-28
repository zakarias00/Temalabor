import 'dart:io';

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

TextEditingController passwordcontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var activityadapter = ActivityAdapter();
  var useradapter = UserAdapter();
  var goaladapter = GoalAdapter();

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
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                    SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("assets/images/cover.jpeg"),
                    ),
                    const SizedBox(height: 50),
                    Row(children: <Widget>[
                      SizedBox(width: 10),
                      Text(
                        'E-mail ',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          controller: emailcontroller,
                          cursorColor: Color.fromRGBO(82, 82, 82, 1.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ]),
                    SizedBox(height: 10),
                    Row(children: <Widget>[
                      SizedBox(width: 10),
                      Text(
                        "Password ",
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          obscureText: true,
                          cursorColor: Color.fromRGBO(82, 82, 82, 1.0),
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ]),
                    TextButton(
                      onPressed: () async {
                        await useradapter.getUsers();
                        bool valid = await validateLogin();
                        if (valid == true) {
                          user = await validatedUser();
                          await useradapter.getUsers();
                          await activityadapter.getActivityByUserId(user.Id);
                          sports = await getSports();
                         await goaladapter.getGoalByDate(DateTime.now().millisecondsSinceEpoch,user.Id);
                         if( goaladapter.goals.length == 0){
                            goaladapter.newGoal(Goal(0,0,user.Id,DateTime.now().millisecondsSinceEpoch,0,0));
                          }
                          emailcontroller.clear();
                          passwordcontroller.clear();
                          print(user.Username);
                          if (user.Email == "admin" &&
                              user.Password == "admin") {
                            Navigator.pushNamed(
                              context,
                              "/adminscreen",
                            );
                          } else {
                            Navigator.pushNamed(
                              context,
                              "/homepage",
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Not a valid data')),
                          );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const Text('-Or-'),
                    TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, "/registerpage");
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
            )),
      ],
    );
  }

  Future<bool> validateLogin() async {
    bool find = false;
    useradapter.users.forEach((element) async {
      if (element.Email == emailcontroller.text &&
          element.Password == passwordcontroller.text) {
        find = true;
        user = await useradapter.getUserById(element.Id);
      }
    });

    if (find == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> validatedUser() async {
    useradapter.getUsers();
    useradapter.users.forEach((element) async {
      if (element.Email == emailcontroller.text &&
          element.Password == passwordcontroller.text) {
        user = await useradapter.getUserById(element.Id);
      }
    });
    print(user.Id);
    return user;
  }
}
