import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/widgets/bestpractices_grid.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'home_web.dart';

class BestPracticesHome extends StatelessWidget {
  static const String rout = '/bestpractices';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (!kIsWeb)
          ? true
          : Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: HomeScreen.rout),
                  builder: (context) => HomeScreen())),
      child: Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, () {
                Navigator.popAndPushNamed(context, rout);
              })
            : AppBar(
                title: Text(d.Best_Practices),
              ),
        body: Scrollbar(
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: BestPracticesGrid())),
        ),
      ),
    );
  }
}
