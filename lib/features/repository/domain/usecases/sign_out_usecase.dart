import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class SignOutUsecase {
  final FirebaseRepository repository;
  SignOutUsecase({this.repository});

  Future<void> call() async {
    repository.signOut();
  }
}
