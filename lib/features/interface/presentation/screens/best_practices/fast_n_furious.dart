import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class FastNFurious extends StatefulWidget {
  static const String rout = '/fastnfurious';

  @override
  _FastNFuriousState createState() => _FastNFuriousState();
}

class _FastNFuriousState extends State<FastNFurious> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/fast_n_furious.png',
      text: d.FastAndFuriousTEXT,
      name: d.FastAndFurious,
    );
  }
}
