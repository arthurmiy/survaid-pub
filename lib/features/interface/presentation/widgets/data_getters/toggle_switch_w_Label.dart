import 'package:capimobile/core/language/language_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitchWithLabel extends StatelessWidget {
  final ValueChanged<bool> onToggle;
  final bool status;
  final String label;

  ToggleSwitchWithLabel({this.onToggle, this.status, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            label,
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Theme.of(context).accentColor),
          )),
          FlutterSwitch(
            width: 70.0,
            height: 35.0,
            valueFontSize: 8.0,
            toggleSize: 30.0,
            value: status,
            borderRadius: 30.0,
            showOnOff: true,
            activeColor: Theme.of(context).primaryColor,
            activeText: d.Yes,
            inactiveText: d.No,
            onToggle: onToggle,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
