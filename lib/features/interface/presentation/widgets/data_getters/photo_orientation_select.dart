import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/toggleVersion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PhotoOrientationSelector extends StatelessWidget {
  static final int LANDSCAPE = 0;
  static final int PORTRAIT = 1;
  final int initialLabelIndex;
  final OnToggle onToggle;
  final String text;

  PhotoOrientationSelector(
      {this.initialLabelIndex = 0, this.onToggle, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontFamily: 'SourceSansPro', fontSize: 18),
          )),
          MyToggle(onToggle, initialLabelIndex, text == d.Landscape ? 1 : 0),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
