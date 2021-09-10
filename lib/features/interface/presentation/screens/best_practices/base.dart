import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/best_practices_home.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseBestPracticePage extends StatelessWidget {
  final String name;
  final String imgPath;
  final String text;
  final GestureTapCallback refresh;

  BaseBestPracticePage(this.refresh,
      {@required this.name, @required this.text, @required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (!kIsWeb)
          ? true
          : Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: BestPracticesHome.rout),
                  builder: (context) => BestPracticesHome())),
      child: Scaffold(
        appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
            ? WebAppBar(context, refresh)
            : AppBar(
                title: Text(d.Best_Practices),
              ),
        body: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: 1000),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Hero(
                              tag: name,
                              child: Image.asset(
                                imgPath,
                                height: 60,
                                width: 60,
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
