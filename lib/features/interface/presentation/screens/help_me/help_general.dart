import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../edit_survey.dart';

class HelpGeneral extends StatelessWidget {
  static const String route = '/helpGeneral';
  @override
  Widget build(BuildContext context) {
    Widget page = Scaffold(
        appBar: AppBar(
          title: Text(d.General),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    d.SideOverlap,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_SIDE_OVERLAP_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('images/sidelap.webp'),
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
                                    d.FrontOverlap,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_FRONTAL_OVERLAP_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('images/frontlap.webp'),
                                ),
                              ),
                              Divider(),
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
                                    d.HELP_GENERAL_STRUCTURES,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_STRUCTURES_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Divider(),
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
                                    d.PhotoOrientation,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_CAMERA_ORIENTATION_P1,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_CAMERA_ORIENTATION_P2,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('images/portrait.png'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_GENERAL_CAMERA_ORIENTATION_P3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('images/landscape.png'),
                                ),
                              ),
                            ]),
                      ))),
            ),
          ),
        ));

    return (kIsWeb)
        ? WillPopScope(
            onWillPop: () async => Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(name: EditSurvey.route),
                    builder: (context) => EditSurvey(EditSurveyArguments(
                        SurveyDataEntity.fromString(
                            currentDataStrBackup))))), //EditSurveyArguments(tmp)
            child: page)
        : page;
  }
}
