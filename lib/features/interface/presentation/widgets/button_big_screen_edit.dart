import 'package:flutter/material.dart';

class ButtonBigScreen extends StatelessWidget {
  final Widget icon;
  final String text;
  final GestureTapCallback onPressed;
  final Color disabledColor;
  final Color color;

  ButtonBigScreen(this.text,
      {this.icon, this.onPressed, this.disabledColor, this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Expanded(
                  child: Text(
                text,
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
        color: color,
        disabledColor: Theme.of(context).colorScheme.primaryVariant,
        onPressed: onPressed);
  }
}
