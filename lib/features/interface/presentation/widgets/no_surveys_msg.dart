import 'package:capimobile/core/language/language_list.dart';
import 'package:flutter/material.dart';

class NoSurveysMsgWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        d.NoSurveysYet,
        style: TextStyle(color: Theme.of(context).disabledColor),
      ),
    );
  }
}
