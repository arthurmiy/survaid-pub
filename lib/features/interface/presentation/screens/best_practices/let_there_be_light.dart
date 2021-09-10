import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class LetThereBeLight extends StatefulWidget {
  static const String rout = '/lettherebelight';

  @override
  _LetThereBeLightState createState() => _LetThereBeLightState();
}

class _LetThereBeLightState extends State<LetThereBeLight> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/let_there_be_light.png',
      text: d.LetThereBeLightTEXT,
      name: d.LetThereBeLight,
    );
  }
}
