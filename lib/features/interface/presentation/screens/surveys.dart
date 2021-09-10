import 'dart:io';

import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/edit_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/text_input_w_label.dart';
import 'package:capimobile/features/interface/presentation/widgets/floating_action_bubble/floating_action_bubble.dart';
import 'package:capimobile/features/interface/presentation/widgets/majascan_web.dart'
    if (dart.library.io) 'package:majascan/majascan.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:capimobile/features/repository/presentation/widgets/surveys_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:capimobile/features/interface/presentation/screens/surveys_web.dart'
// if (dart.library.io) 'package:capimobile/features/interface/presentation/screens/surveys.dart';
// import 'package:majascan/majascan.dart';

// import 'package:majascan/majascan.dart';

class Surveys extends StatefulWidget {
  static const String rout = '/survey';
  @override
  _SurveysState createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> with SingleTickerProviderStateMixin {
  List<Widget> surveys = [];
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    BlocProvider.of<SurveyCubit>(context).getSurveys();
    BlocProvider.of<CameraCubit>(context).getCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width > PAGE_WIDTH_SWITCH_APP_BAR
          ? WebAppBar(context, () {
              setState(() {});
            })
          : AppBar(
              title: Text(d.My_Surveys),
            ),
      body: Scrollbar(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              constraints: BoxConstraints(maxWidth: 1000),
              child: SurveysList()),
        ),
      ),
      floatingActionButton:
          BlocBuilder<SurveyCubit, SurveyState>(builder: (cont, state) {
        if (state is SurveyLoaded) {
          return FloatingActionBubble(
            backGroundColor: Theme.of(context).colorScheme.primaryVariant,
            // On pressed change animation state
            onPress: () {
              if (_animationController.isCompleted) {
                setState(() {
                  _animationController.reverse();
                });
              } else {
                _animationController.forward();
              }
            },
            // Menu items
            items: <Bubble>[
              // Floating action menu item
              Bubble(
                title: d.ManualInput,
                iconColor: Theme.of(context).colorScheme.onPrimary,
                bubbleColor: Theme.of(context).colorScheme.primaryVariant,
                icon: Icons.keyboard,
                titleStyle: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary),
                onPress: () {
                  _animationController.reverse();
                  _newSurvey(state.survey);
                },
              ),
              // Floating action menu item
              Bubble(
                title: d.QrCodeImport,
                iconColor: Theme.of(context).colorScheme.onPrimary,
                bubbleColor: Theme.of(context).colorScheme.primaryVariant,
                icon: Icons.qr_code_scanner,
                titleStyle: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary),
                onPress: () async {
                  _animationController.reverse();

                  String results = await MajaScan.startScan(
                      title: d.QrCodeImport,
                      barColor: Theme.of(context).colorScheme.primary,
                      titleColor: Theme.of(context).colorScheme.onPrimary,
                      qRCornerColor: Colors.green,
                      qRScannerColor: Colors.greenAccent,
                      flashlightEnable: true,
                      scanAreaScale: 0.7

                      /// value 0.0 to 1.0
                      );

                  if (results != null) {
                    SurveyDataEntity tmp = SurveyDataEntity.fromString(results);

                    setState(() {
                      if (tmp.surveyName == '\$Error') {
                        final snackBar = SnackBar(content: Text(d.QrCodeError));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                        Scaffold.of(cont).showSnackBar(snackBar);
                      } else {
                        Navigator.pushNamed(context, EditSurvey.route,
                            arguments: EditSurveyArguments(tmp));
                      }
                    });
                  }
                },
              ),
            ],

            // animation controller
            animation: _animation,

            // Floating Action button Icon color
            iconColor: Colors.blue,
          );
          //   FloatingActionButton(
          //   onPressed: () {
          //     _newSurvey(state.survey);
          //   },
          //   tooltip: d.New_Survey,
          //   child: new Icon(Icons.add),
          // );
        } else {
          BlocProvider.of<SurveyCubit>(context).getSurveys();
          return FloatingActionButton(
            onPressed: () {
              _animationController.isCompleted
                  ? _animationController.reverse
                  : _animationController.forward;
            },
            //tooltip: d.New_Survey,
            child: new Icon(Icons.add),
          );
        }
      }),
    );
  }

  void _newSurvey(List<SurveyDataEntity> surveys) {
    _showMyDialog(context, surveys);
  }

  bool isInList(List<SurveyDataEntity> surveys, String name) {
    for (var i = 0; i < surveys.length; i++) {
      if (surveys[i].surveyName.toUpperCase() == name.toUpperCase()) {
        return true;
      }
    }

    return false;
  }

  Future<void> _showMyDialog(
      BuildContext context, List<SurveyDataEntity> surveys) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        String errorMsg;
        TextEditingController tmp = TextEditingController();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(d.New_Survey),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextInputWithLabel(
                      controller: tmp,
                      title: d.Name,
                      errorText: errorMsg,
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(d.Ok),
                  onPressed: () {
                    if (tmp.text.isEmpty) {
                      setState(() {
                        errorMsg = d.Required;
                      });
                    } else {
                      if (isInList(surveys, tmp.text)) {
                        setState(() {
                          errorMsg = d.RepeatedName;
                        });
                      } else {
                        Navigator.of(context).popAndPushNamed(EditSurvey.route,
                            arguments: EditSurveyArguments(SurveyDataEntity(
                                null,
                                null,
                                tmp.text,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null)));
                      }
                    }
                  },
                ),
                TextButton(
                  child: Text(d.Cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
