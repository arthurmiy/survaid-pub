import 'package:flutter/material.dart';

//Display info (title +value)
class SimpleInfoDisplay extends StatelessWidget {
  final String title;
  final String content;

  SimpleInfoDisplay(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: Text(
            "$title:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Text(
              "$content",
              style: TextStyle(fontFamily: 'SourceSansPro'),
            ),
          ),
        )
      ],
    );
  }
}
