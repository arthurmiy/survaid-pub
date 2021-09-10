import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/edit_survey.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/no_surveys_msg.dart';
import 'package:capimobile/features/interface/presentation/widgets/survey_tile.dart';
import 'package:capimobile/features/repository/presentation/cubit/survey/survey_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveysList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(builder: (_, state) {
      if (state is SurveyLoaded) {
        if (state.survey.length == 0) {
          return NoSurveysMsgWidget();
        }
        return ListView(
          shrinkWrap: true,
          children: state.survey
              .map((e) => SurveyTile(
                    name: e.surveyName,
                    onTap: () {
                      pdfDataSrc = e;
                      Navigator.pushNamed(context, ViewSurvey.route);
                    },
                    onEdit: () {
                      Navigator.pushNamed(context, EditSurvey.route,
                          arguments: EditSurveyArguments(e));
                    },
                    onDelete: () {
                      _showMyDialog(context, e.surveyName);
                    },
                    date: e.time,
                  ))
              .toList(),
        );
      } else if (state is SurveyInitial) {
        return NoSurveysMsgWidget();
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  Future<void> _showMyDialog(BuildContext context, String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(d.SURVEY_DELETION_CONFIRMATION),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(d.Yes),
              onPressed: () {
                BlocProvider.of<SurveyCubit>(context).deleteSurvey(name);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(d.No),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
