import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/domain/usecases/append_new_survey_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/delete_survey_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/get_surveys_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final GetSurveysUsecase getSurveysUsecase;
  final AppendNewSurveyUsecase appendNewSurveyUsecase;
  final DeleteSurveyUsecase deleteSurveyUsecase;

  SurveyCubit(
      {this.getSurveysUsecase,
      this.appendNewSurveyUsecase,
      this.deleteSurveyUsecase})
      : super(SurveyInitial());

  Future<void> appendNewSurvey({SurveyDataEntity surveyData}) async {
    try {
      emit(SurveySaving());
      await appendNewSurveyUsecase.call(surveyData);
      emit(SurveySaved());
    } on SocketException catch (e) {
      emit(SurveySavingError(error: e.message));
    }
  }

  Future<void> getSurveys() async {
    try {
      final cameras = getSurveysUsecase.call();
      emit(SurveyLoaded(survey: []));
      cameras.listen((surv) {
        emit(SurveyLoaded(survey: surv));
      });
    } on SocketException catch (_) {}
  }

  Future<void> deleteSurvey(String surveyName) async {
    await deleteSurveyUsecase.call(surveyName);
  }
}
