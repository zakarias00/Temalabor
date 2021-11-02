import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalDataScreen extends StatelessWidget{
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Enter your personal datas',textAlign: TextAlign.center, style: TextStyle( fontSize:  30),),
            Row(
                children: const <Widget>[
                  Text('Gender:',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'choose gender',
                      ),
                    ),
                  )
                ]
            ),
            Row(
                children: const <Widget>[
                  Text('Birth date:',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'choose date',
                      ),
                    ),
                  )
                ]
            ),
            Row(
                children: const <Widget>[
                  Text('Height(cm): ',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height',
                      ),
                        keyboardType: TextInputType.number
                    )
                  )
                ]
            ),
            Row(
                children: const <Widget>[
                  Text('Weight (kg):',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                        keyboardType: TextInputType.number
                    ),
                  )
                ]
            ),
            TextButton(
              onPressed: (){
              },
              child: const Text("Submit"),
            ),
            ElevatedButton(
              child: const Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
    );
  }

}
