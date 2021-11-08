import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/datas/testperson.dart';
import 'package:get_fit/pages/homescreen.dart';


// TODO le kell kerdezni az osszes felhasznalo jelszo es email parosat es megnezni hogy valid-e, hibauzenet ha nem jo


TextEditingController passwordcontroller = TextEditingController();

class LoginScreen extends StatelessWidget{

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
              const Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),

              const SizedBox(height: 50),
              Row(
                  children: const <Widget>[
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
                onPressed: (){
                  if( validatePassword(passwordcontroller.text)){
                    Navigator.pushNamed(
                      context,
                      "/homepage",
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Try again')),
                    );
                  }
                },
                child: const Text("Login", style: TextStyle(fontSize:  20)),
              ),
              const Text('-Or-'),
              TextButton(onPressed: (){

                  Navigator.pushNamed(
                    context,
                    "/registerpage");


              }, child: const Text('Register', style: TextStyle(fontSize:  20))),

            ]
        ),
      )
    );
  }

  bool validatePassword(String value) {
    //TODO felhasznalo jelszo paros megfelelo-e
    if (!(value.length > 5) && value.isNotEmpty) {
      return true;
    }
    return false;
  }

}