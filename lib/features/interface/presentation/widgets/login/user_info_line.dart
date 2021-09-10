import 'package:flutter/material.dart';

class UserInfoLine extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  UserInfoLine(this.fieldName, this.fieldValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          fieldName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          fieldValue,
          style: TextStyle(fontFamily: 'SourceSansPro'),
        ),
      ],
    );
  }
}
