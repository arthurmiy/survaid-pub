import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class GetSurveysUsecase {
  final FirebaseRepository repository;
  GetSurveysUsecase({this.repository});

  Stream<List<SurveyDataEntity>> call() => repository.getSurveys();
}
