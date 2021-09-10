import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../edit_survey.dart';

class HelpDimensions extends StatelessWidget {
  static const String route = '/helpDiemsions';

  @override
  Widget build(BuildContext context) {
    Widget page = Scaffold(
        appBar: AppBar(
          title: Text(d.Dimensions),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_DIMENSIONS_CONSIDER,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  d.HELP_DIMENSIONS_TO_DETERMINE,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
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
                                    d.HELP_DIMENSIONS_SET_OUTCROP,
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
                                  d.HELP_DIMENSIONS_SET_OUTCROP_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
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
                                    d.HELP_DIMENSIONS_SET_GSD,
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
                                  d.HELP_DIMENSIONS_SET_GSD_TEXT,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 18),
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
