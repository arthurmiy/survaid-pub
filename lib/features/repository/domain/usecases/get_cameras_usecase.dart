import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class GetCamerasUsecase {
  final FirebaseRepository repository;
  GetCamerasUsecase({this.repository});
  Stream<List<CameraEntity>> call() => repository.getCameras();
}
