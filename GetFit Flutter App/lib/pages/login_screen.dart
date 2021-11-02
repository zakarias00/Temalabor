import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
              Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),

              Row(
                  children: const <Widget>[
                    Text('E-mail',
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
                  children: const <Widget>[
                    Text("Password",
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
                },
                child: const Text("Login"),
              ),
              const Text('-Or-'),
              TextButton(onPressed: (){

              }, child: Text('Register')),
              ElevatedButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]
        ),
      )
    );
  }

}