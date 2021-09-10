import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  LinkButton(this.text, {@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
            child: Text(
              text,
            ),
          ),
        ));
  }
}
