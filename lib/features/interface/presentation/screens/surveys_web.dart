import 'package:capimobile/core/constants.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/edit_survey.dart';
import 'package:capimobile/features/interface/presentation/screens/home_web.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/text_input_w_label.dart';
import 'package:capimobile/features/interface/presentation/widgets/web_app_bar.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/presentation/cubit/camera/camera_cubit.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:capimobile/features/repository/presentation/widgets/surveys_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:majascan/majascan.dart';

class Surveys extends StatefulWidget {
  static const String rout = '/survey';
  @override
  _SurveysState createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> with SingleTickerProviderStateMixin {
  List<Widget> surveys = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<SurveyCubit>(context).getSurveys();
    BlocProvider.of<CameraCubit>(context).getCameras();
  }

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
                title: Text(d.My_Surveys),
              ),
        body: Scrollbar(
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  // decoration: BoxDecoration(
                  //     border: Border(
                  //         left: BorderSide(color: Colors.black, width: 3))),
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: SurveysList())),
        ),
        floatingActionButton:
            BlocBuilder<SurveyCubit, SurveyState>(builder: (cont, state) {
          if (state is SurveyLoaded) {
            return FloatingActionButton(
              onPressed: () {
                _newSurvey(state.survey);
              },
              child: Icon(Icons.add),
            );
          } else {
            BlocProvider.of<SurveyCubit>(context).getSurveys();
            return null;
          }
        }),
      ),
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
