import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class PowerToThePeople extends StatefulWidget {
  static const String rout = '/powertothepeople';

  @override
  _PowerToThePeopleState createState() => _PowerToThePeopleState();
}

class _PowerToThePeopleState extends State<PowerToThePeople> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/power_to_the_people.png',
      text: d.PowerToThePeopleTEXT,
      name: d.PowerToThePeople,
    );
  }
}
