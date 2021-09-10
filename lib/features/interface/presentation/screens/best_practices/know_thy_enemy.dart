import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices/base.dart';
import 'package:flutter/material.dart';

class KnowThyEnemy extends StatefulWidget {
  static const String rout = '/knowthyenemy';

  @override
  _KnowThyEnemyState createState() => _KnowThyEnemyState();
}

class _KnowThyEnemyState extends State<KnowThyEnemy> {
  @override
  Widget build(BuildContext context) {
    return BaseBestPracticePage(
      () {
        setState(() {});
      },
      imgPath: 'images/know_thy_enemy.png',
      text: d.KnowThyEnemyTEXT,
      name: d.KnowThyEnemy,
    );
  }
}
