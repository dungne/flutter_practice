import 'package:analog_clock/constants.dart';
import 'package:analog_clock/screens/components/clock.dart';
import 'package:analog_clock/screens/components/clock_painter.dart';
import 'package:analog_clock/screens/components/country_card.dart';
import 'package:analog_clock/screens/components/time_in_hour_and_minute.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Ho Chi Minh, VN | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Spacer(),
            TimeInHourAndMinute(),
            Clock(),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CountryCard(
                    country: 'New York, USA',
                    timeZone: '+3 HRS | EST',
                    iconSrc: 'assets/icons/Liberty.svg',
                    time: '9:20',
                    period: 'PM',
                  ),
                  CountryCard(
                    country: 'Sydney, AU',
                    timeZone: '+19 HRS | AEST',
                    iconSrc: 'assets/icons/Sydney.svg',
                    time: '1:20',
                    period: 'AM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
