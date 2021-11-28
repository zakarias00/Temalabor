import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:provider/src/provider.dart';

class SelectedDate extends ChangeNotifier{
  DateTime selectedDate = DateTime.now();

  void changeDate( DateTime value){
    selectedDate = value;
    notifyListeners();
  }
}


class MyDate extends StatefulWidget {
  @override
  _MyDateState createState() {
    return _MyDateState();
  }
}

class _MyDateState extends State<MyDate> {
  var txt = TextEditingController();
 var selectedDate = SelectedDate();

  @override
  Widget build(BuildContext context) {
    var useradapter = context.read<UserAdapter>();
     selectedDate = context.read<SelectedDate>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          child: Text(
            "Choose date",
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () {
            showDatePicker();
          },
        ),
        SizedBox(width: 10),
        Container(
          width: 90,
          child: TextField(
              controller: txt,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none)),
        ),
      ],
    );
  }

  void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != selectedDate.selectedDate.toString())
                  setState(() {
                   selectedDate.changeDate(value);
                    txt.text = selectedDate.selectedDate.toString();
                  });
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1900,
              maximumYear: 2021,
            ),
          );
        });
  }
}
