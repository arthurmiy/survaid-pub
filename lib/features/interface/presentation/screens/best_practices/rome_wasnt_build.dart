import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class RomeWasntBuild extends StatefulWidget {
  static const String rout = '/romewasntbuild';

  @override
  _RomeWasntBuildState createState() => _RomeWasntBuildState();
}

class _RomeWasntBuildState extends State<RomeWasntBuild> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/rome_wasnt_built.png',
      text: d.RomeWasntBuildInADayTEXT,
      name: d.RomeWasntBuildInADay,
    );
  }
}
