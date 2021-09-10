import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> signUp(String email, String password, String userName);
  Future<UserModel> signIn(String email, String password, String method);
  Future<void> resendConfirmationEmail(String email, String password);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUid();
  Stream<List<SurveyDataEntity>> getSurveys();
  Future<void> getCreateCurrentUser(
      String email, String imgUrl, String userName);
  Stream<List<CameraEntity>> getCameras();
  Future<void> appendNewSurvey(SurveyDataEntity survey);
  Future<void> appendNewCamera(CameraEntity survey);
  Future<UserEntity> getLoggedUser();
  Future<void> deleteCamera(String name);

  Future<void> deleteSurvey(String name);
  Stream<UserModel> listenUserEvents();
}
