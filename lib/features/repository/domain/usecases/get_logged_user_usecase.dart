import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/entities/user_entity.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class GetLoggedUser {
  final FirebaseRepository repository;
  GetLoggedUser({this.repository});
  Future<UserEntity> call() => repository.getLoggedUser();
}
