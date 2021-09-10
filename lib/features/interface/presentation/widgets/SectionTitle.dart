import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final VoidCallback onHelp;
  SectionTitle(this.text, {this.onHelp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          this.onHelp == null
              ? Container()
              : RawMaterialButton(
                  onPressed: onHelp,
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: FaIcon(
                    FontAwesomeIcons.question,
                    size: 20.0,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                )
        ],
      ),
    );
  }
}
