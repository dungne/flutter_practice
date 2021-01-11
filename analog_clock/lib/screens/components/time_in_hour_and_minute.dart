import 'dart:async';

import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeInHourAndMinute extends StatefulWidget {
  @override
  __TimeInHourAndMinuteStateState createState() =>
      __TimeInHourAndMinuteStateState();
}

class __TimeInHourAndMinuteStateState extends State<TimeInHourAndMinute> {
  final formatter = DateFormat('hh:mm');
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DefaultMaterialLocalizations()
              .formatTimeOfDay(_timeOfDay, alwaysUse24HourFormat: true),
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: getProportionateScreenWidth(5)),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        )
      ],
    );
  }
}
