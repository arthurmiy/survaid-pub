import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyToggle extends StatelessWidget {
  final OnToggle onToggle;
  final int initialLabelIndex;
  final int currentValue;
  MyToggle(this.onToggle, this.initialLabelIndex, this.currentValue);
  List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    this.isSelected = [currentValue == 1, currentValue == 0];
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.stay_current_landscape),
        Icon(Icons.stay_current_portrait),
      ],
      borderRadius: BorderRadius.circular(30),
      onPressed: (int index) {
        onToggle(index);
        for (int buttonIndex = 0;
            buttonIndex < isSelected.length;
            buttonIndex++) {
          if (buttonIndex == currentValue) {
            isSelected[buttonIndex] = true;
          } else {
            isSelected[buttonIndex] = false;
          }
        }
      },
      isSelected: isSelected,
    );
  }
}
