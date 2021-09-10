import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class DeleteSurveyUsecase {
  final FirebaseRepository repository;
  DeleteSurveyUsecase({this.repository});

  Future<void> call(String surveyName) async {
    repository.deleteSurvey(surveyName);
  }
}
