import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

class pertama extends StatefulWidget {
  const pertama({super.key});

  @override
  State<pertama> createState() => _pertamaState();
}

class _pertamaState extends State<pertama> {
  DateTime? dateTimeNow = DateTime.now(), dateTimeTomorrow, picked_date;
  var year, month, day;
  TimeOfDay? picked_time, selectedTime = TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimeNow!,
        firstDate: DateTime(dateTimeNow!.year - 1),
        lastDate: DateTime(dateTimeNow!.year + 1));

    if (picked_date != null && picked_date != dateTimeNow) {
      setState(() {
        dateTimeNow = picked_date;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    picked_time = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
    );
    log(picked_time.toString());

    if (picked_time != null && picked_time != selectedTime) {
      setState(() {
        selectedTime = picked_time;
        log("test" + picked_time.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            getDate(context);
          },
          child: Text("Test DatePicker"),
        ),
        MaterialButton(
          onPressed: () {
            getTime(context);
          },
          child: Text("Test TimePicker"),
        ),
        Text("${dateTimeNow.toString().substring(0, 10)}"),
        Text("${selectedTime.toString().substring(10, 15)}"),
      ],
    ));
  }
}
