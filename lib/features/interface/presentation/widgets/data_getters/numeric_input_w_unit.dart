import 'package:flutter/material.dart';

class NumericInputWithUnit extends StatefulWidget {
  final String title, unit;
  final TextEditingController controller;
  final Function(String value) onChanged;
  final GestureTapCallback onTap;
  final bool disable;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;

  NumericInputWithUnit(
      {this.title,
      this.unit,
      this.controller,
      this.onChanged,
      this.onTap,
      this.disable = false,
      this.focusNode,
      this.onSubmitted});

  @override
  _NumericInputWithUnitState createState() => _NumericInputWithUnitState();
}

class _NumericInputWithUnitState extends State<NumericInputWithUnit> {
  @override
  Widget build(BuildContext context) {
    InputDecoration currentTheme = (widget.disable)
        ? InputDecoration(
            //disabled
            labelStyle: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Theme.of(context).primaryColorLight),
            suffixStyle: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Theme.of(context).primaryColorLight),
            labelText: widget.title,
            suffixText: widget.unit,
          )
        : InputDecoration(
            labelStyle: TextStyle(fontFamily: 'SourceSansPro'),
            suffixStyle: TextStyle(fontFamily: 'SourceSansPro'),
            labelText: widget.title,
            suffixText: widget.unit,
          );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        decoration: currentTheme,
        focusNode: widget.focusNode,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            color: widget.disable
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).textTheme.bodyText1.color),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (widget.onChanged == null)
            ? (value) {}
            : (value) => widget.onChanged(value),
        onTap: widget.onTap,
      ),
    );
  }
}
