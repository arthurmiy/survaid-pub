import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class FixedPoint extends StatefulWidget {
  static const String rout = '/fixedPoint';

  @override
  _FixedPointState createState() => _FixedPointState();
}

class _FixedPointState extends State<FixedPoint> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/fixed_point.png',
      text: d.FixedPointInTimeTEXT,
      name: d.FixedPointInTime,
    );
  }
}
