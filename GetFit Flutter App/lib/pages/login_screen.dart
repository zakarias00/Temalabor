import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/adapter/SportAdapter.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:get_fit/datas/Activity.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/datas/Goal.dart';
import 'package:get_fit/datas/Sport.dart';
import 'package:get_fit/datas/User.dart';
import 'package:get_fit/datas/testperson.dart';
import 'package:get_fit/pages/homescreen.dart';


// TODO le kell kerdezni az osszes felhasznalo jelszo es email parosat es megnezni hogy valid-e, hibauzenet ha nem jo


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
    users.forEach((element) {
      if (element.Email == emailcontroller.text
          && element.Password == passwordcontroller.text) {
        find = true;
      }
    });
    if (find == true) {
      return true;
    }
    return false;
  }
}
