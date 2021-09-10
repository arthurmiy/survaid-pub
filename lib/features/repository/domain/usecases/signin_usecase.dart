import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class SingInUsecase {
  final FirebaseRepository repository;
  SingInUsecase({this.repository});

  Future<UserModel> call(String email, String password, String method) async {
    return repository.signIn(email, password, method);
  }
}
