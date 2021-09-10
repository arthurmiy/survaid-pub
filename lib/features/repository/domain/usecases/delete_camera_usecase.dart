import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class DeleteCameraUsecase {
  final FirebaseRepository repository;
  DeleteCameraUsecase({this.repository});

  Future<void> call(String cameraName) async {
    repository.deleteCamera(cameraName);
  }
}
