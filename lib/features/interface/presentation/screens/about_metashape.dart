import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_web.dart';

class AboutMetashape extends StatefulWidget {
  static const String route = '/aboutmetashape';
  @override
  _AboutMetashapeState createState() => _AboutMetashapeState();
}

class _AboutMetashapeState extends State<AboutMetashape> {
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
                setState(() {});
              })
            : AppBar(
                title: Text(d.AboutMetashape),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 18),
                                children: [
                                  TextSpan(
                                    text: 'Agisoft Metashape',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 18,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL('https://www.agisoft.com/');
                                      },
                                  ),
                                  TextSpan(text: d.ABOUT_METASHAPE_INTRO)
                                ]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            d.ABOUT_METASHAPE_DEVELOPMENT,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            d.ABOUT_METASHAPE_OUTRO,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              d.Ram,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            d.ABOUT_METASHAPE_RAM,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              d.Cpu,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            d.ABOUT_METASHAPE_CPU,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              d.Gpu,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            d.ABOUT_METASHAPE_GPU,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 18),
                                children: [
                                  TextSpan(text: d.ABOUT_METASHAPE_AT_AGiSOFT),
                                  TextSpan(
                                    text: d.ABOUT_METASHAPE_BASIC_CONFIGURATION,
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 18,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            'https://www.agisoft.com/downloads/system-requirements/');
                                      },
                                  ),
                                  TextSpan(text: d.ABOUT_METASHAPE_CPU_WITH)
                                ]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 18),
                                children: [
                                  TextSpan(text: d.ABOUT_METASHAPE_THIS_LIST),
                                  TextSpan(
                                    text: d.ABOUT_METASHAPE_TEST_RESULTS,
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 18,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            'https://www.pugetsystems.com/recommended/Recommended-Systems-for-Agisoft-Metashape-145/Hardware-Recommendations');
                                      },
                                  ),
                                  TextSpan(
                                      text: d
                                          .ABOUT_METASHAPE_THEIR_RECOMMENDATIONS)
                                ]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 18),
                                children: [
                                  TextSpan(text: d.ABOUT_METASHAPE_YOU_CAN),
                                  TextSpan(
                                    text: d.ABOUT_METASHAPE_RUN_THE_BENCHMARK,
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 18,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            'https://www.pugetsystems.com/labs/articles/Metashape-Benchmark-1457/');
                                      },
                                  ),
                                  TextSpan(
                                      text: d.ABOUT_METASHAPE_ON_YOUR_COMPUTER)
                                ]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro', fontSize: 18),
                                children: [
                                  TextSpan(
                                      text: d.ABOUT_METASHAPE_A_USEFUL_TIP,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: d
                                        .ABOUT_METASHAPE_A_USEFUL_TIP_CONTINUATION,
                                  )
                                ]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
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

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('error url');
    }
  }
}
