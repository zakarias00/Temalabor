import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/datas/person.dart';
import 'package:get_fit/pages/homescreen.dart';



class LoginScreen extends StatelessWidget{

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
              Text('Login',textAlign: TextAlign.center,style: const TextStyle(fontSize: 30)),

              Row(
                  children: <Widget>[
                    Text('E-mail ',
                      textAlign: TextAlign.left,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                      ),
                    )
                  ]
              ),
              Row(
                  children:  <Widget>[
                    Text("Password ",
                      textAlign: TextAlign.left,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    )
                  ]
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    "/homepage",
                  );
                },
                child: const Text("Login"),
              ),
              const Text('-Or-'),
              TextButton(onPressed: (){
                Navigator.pushNamed(
                  context,
                  "/registerpage",
                );

              }, child: Text('Register')),

            ]
        ),
      )
    );
  }

}