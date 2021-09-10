import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class AppendNewCameraUsecase {
  final FirebaseRepository repository;
  AppendNewCameraUsecase({this.repository});
  Future<void> call(CameraEntity survey) async {
    repository.appendNewCamera(survey);
  }
}
