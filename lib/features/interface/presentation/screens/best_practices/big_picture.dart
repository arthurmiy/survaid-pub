import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class BigPicture extends StatefulWidget {
  static const String rout = '/bigpicture';

  @override
  _BigPictureState createState() => _BigPictureState();
}

class _BigPictureState extends State<BigPicture> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/big_picture.png',
      text: d.GetTheBigPctureTEXT,
      name: d.GetTheBigPcture,
    );
  }
}
