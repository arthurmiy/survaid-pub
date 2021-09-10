import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class ListenUserEventsUsecase {
  final FirebaseRepository repository;
  ListenUserEventsUsecase({this.repository});
  Stream<UserModel> call() => repository.listenUserEvents();
}
