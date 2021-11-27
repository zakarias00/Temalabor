
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';


DateTime selectedDate = DateTime.now();
class MyDate extends StatefulWidget {
  @override
  _MyDateState createState()
  {
    return _MyDateState();
  }
}

class _MyDateState extends State<MyDate> {
  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: Text("Choose date", style: TextStyle( fontSize: 15),),
            onPressed: (){
              showDatePicker();
            },
          ),
          SizedBox(width:10),
          Container(
            width: 90,
            child: TextField(
                controller: txt,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none)
            ),
          ),
        ],
      );
  }

  void showDatePicker()
  {  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height*0.25,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              if (value != null && value != selectedDate)
                setState(() {
                  selectedDate = value;
                  user.Birthdate = selectedDate.toString();
                  txt.text = selectedDate.toString();
                  print(user.Birthdate);
                });
            },
            initialDateTime: DateTime.now(),
            minimumYear: 1900,
            maximumYear: 2021,
          ),
        );
      }
  );
  }
}