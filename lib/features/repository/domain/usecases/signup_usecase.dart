import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class SignUpUsecase {
  final FirebaseRepository repository;
  SignUpUsecase({this.repository});

  Future<void> call(String email, String password, String userName) async {
    repository.signUp(email, password, userName);
  }
}
