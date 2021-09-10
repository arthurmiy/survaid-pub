import 'package:capimobile/core/language/language_list.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String dropdownValue;
  final Function onChangeCallback;

  LanguageSelector(this.dropdownValue, this.onChangeCallback);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      underline: Container(
        height: 2,
        color: Theme.of(context).colorScheme.primary,
      ),
      onChanged: (String newValue) {
        onChangeCallback(newValue);
      },
      items: LanguageList.languageList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Image(
                image: AssetImage(
                    LanguageList.languageDisplayInfo[value].iconPath,
                    package: 'country_icons'),
                width: 18,
                height: 18,
                color: null,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Text(LanguageList.languageDisplayInfo[value].text),
            ],
          ),
        );
      }).toList(),
    );
  }
}
