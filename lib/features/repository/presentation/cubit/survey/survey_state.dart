part of 'survey_cubit.dart';

@immutable
abstract class SurveyState extends Equatable {}

class SurveyInitial implements SurveyState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class SurveyLoading implements SurveyState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class SurveyLoaded implements SurveyState {
  final List<SurveyDataEntity> survey;

  SurveyLoaded({this.survey});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class SurveySaving implements SurveyState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class SurveySaved implements SurveyState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class SurveySavingError implements SurveyState {
  final String error;
  SurveySavingError({this.error});

  @override
  List<Object> get props => [this.error];

  @override
  bool get stringify => false;
}
