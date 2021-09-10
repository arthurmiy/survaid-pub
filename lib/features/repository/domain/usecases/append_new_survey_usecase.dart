import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class AppendNewSurveyUsecase {
  final FirebaseRepository repository;
  AppendNewSurveyUsecase({this.repository});

  Future<void> call(SurveyDataEntity survey) async {
    repository.appendNewSurvey(survey);
  }
}
