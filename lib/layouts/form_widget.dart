import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testas/cons.dart';
import 'package:testas/layouts/Radio.dart';
import 'package:testas/layouts/exten.dart';

class FormWidget extends StatelessWidget {
  FormWidget(
      {Key? key,
      required this.formkey,
      required this.title_controller,
      required this.date_controller,
      required this.time_controller,
      required this.time})
      : super(key: key);

  final GlobalKey<FormState> formkey;
  final TextEditingController title_controller;
  final TextEditingController date_controller;
  final TextEditingController time_controller;
  final TextEditingController time;
  Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        color: sec_color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: title_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(labelText: "title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: date_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    print(value.toString());

                    return "enter";
                  } else {
                    return null;
                  }
                },
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse("2030-02-27"))
                      .then((value) {
                    date_controller.text =
                        DateFormat('yyyy-MM-dd').format(value!).toString();
                    print(date_controller.text);
                  }).catchError((onError) {});
                },
                decoration: InputDecoration(labelText: "date"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: time_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    print(value.toString());

                    return "enter";
                  } else {
                    return null;
                  }
                },
                onTap: () {
               
                    
        
                  showTimePicker(context: context, initialTime:TimeOfDay.now().addHour(1))
                      .then((value) {
                    duration = Duration(
                        hours: value!.hour, minutes: value.minute, seconds: 00);
                    time.text = duration.toString();

                    time_controller.text = value.format(context);
                    print(time.text);
                    print(time_controller.text);
                  }).catchError((onError) {});
                },
                decoration: InputDecoration(labelText: "time"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RadioClass(),
          ],
        ),
      ),
    );
  }
}
