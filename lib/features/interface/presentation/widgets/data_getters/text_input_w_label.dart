import 'package:flutter/material.dart';

class TextInputWithLabel extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String errorText;

  TextInputWithLabel({this.title, this.controller, this.errorText});

  @override
  _TextInputWithLabelState createState() => _TextInputWithLabelState();
}

class _TextInputWithLabelState extends State<TextInputWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.title,
            labelStyle: TextStyle(fontFamily: 'SourceSansPro'),
            suffixStyle: TextStyle(fontFamily: 'SourceSansPro'),
            errorText: widget.errorText),
        style: TextStyle(fontFamily: 'SourceSansPro'),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
