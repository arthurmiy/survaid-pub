import 'package:capimobile/features/repository/data/datasource/firebase_remote_datasource.dart';
import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:capimobile/features/repository/domain/entities/user_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class FireBaseRepositoryImpl implements FirebaseRepository {
  final FireBaseRemoteDataSource fireBaseRemoteDataSource;

  FireBaseRepositoryImpl({this.fireBaseRemoteDataSource});

  @override
  Future<void> appendNewCamera(CameraEntity survey) async {
    return await fireBaseRemoteDataSource.appendNewCamera(survey);
  }

  @override
  Future<void> appendNewSurvey(SurveyDataEntity survey) async {
    return await fireBaseRemoteDataSource.appendNewSurvey(survey);
  }

  @override
  Stream<List<CameraEntity>> getCameras() {
    return fireBaseRemoteDataSource.getCameras();
  }

  @override
  Future<void> getCreateCurrentUser(
      String email, String imgUrl, String userName) async {
    return await fireBaseRemoteDataSource.getCreateCurrentUser(
        email, imgUrl, userName);
  }

  @override
  Future<String> getCurrentUid() async =>
      fireBaseRemoteDataSource.getCurrentUid();

  @override
  Stream<List<SurveyDataEntity>> getSurveys() {
    return fireBaseRemoteDataSource.getSurveys();
  }

  @override
  Future<bool> isSignIn() async => await fireBaseRemoteDataSource.isSignIn();

  @override
  Future<UserModel> signIn(String email, String password, String method) async {
    return await fireBaseRemoteDataSource.signIn(email, password, method);
  }

  @override
  Future<void> signOut() async {
    return await fireBaseRemoteDataSource.signOut();
  }

  @override
  Future<void> signUp(String email, String password, String userName) async {
    return await fireBaseRemoteDataSource.signUp(email, password, userName);
  }

  @override
  Future<UserEntity> getLoggedUser() async {
    return fireBaseRemoteDataSource.getLoggedUser();
  }

  @override
  Future<void> deleteCamera(String name) async {
    return await fireBaseRemoteDataSource.deleteCamera(name);
  }

  @override
  Future<void> deleteSurvey(String name) {
    return fireBaseRemoteDataSource.deleteSurvey(name);
  }

  @override
  Stream<UserModel> listenUserEvents() {
    return fireBaseRemoteDataSource.listenUserEvents();
  }

  @override
  Future<UserModel> resendConfirmationEmail(String email, String password) {
    throw fireBaseRemoteDataSource.resendConfirmationEmail(email, password);
  }
}
