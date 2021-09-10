import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/core/licenses/licenses_repo.dart';
import 'package:capimobile/features/interface/presentation/screens/home_web.dart';
import 'package:capimobile/features/interface/presentation/screens/license_show.dart';
import 'package:capimobile/features/interface/presentation/widgets/license_tile.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  static const String route = '/about';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                title: Text('${d.About} - V. 1.0.1'),
              ),
        body: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        kIsWeb ? d.ABOUT_INTRO_WEB : d.ABOUT_INTRO,
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
                          d.About_the_Authors,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                            style: TextStyle(
                                fontFamily: 'SourceSansPro', fontSize: 18),
                            children: [
                              TextSpan(
                                text: 'AA Miyazaki',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        'https://www.linkedin.com/in/arthur-alves-miyazaki-74765910b/');
                                  },
                              ),
                              TextSpan(text: d.ABOUT_ARTHUR)
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
                                text: 'CD Viana',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        'https://www.researchgate.net/profile/Camila_Viana3');
                                  },
                              ),
                              TextSpan(text: d.ABOUT_CAMILA)
                            ]),
                        textAlign: TextAlign.justify,
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
                          d.Licenses,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: licenses.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return LicenseTile(
                            licenseName: licenses[i].packageName,
                            author: licenses[i].author,
                            type: licenses[i].licenseType,
                            version: licenses[i].packageVersion,
                            onTap: () {
                              Navigator.pushNamed(context, LicenseShow.route,
                                  arguments: i);
                            },
                          );
                        })
                  ]),
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
