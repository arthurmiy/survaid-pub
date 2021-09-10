import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUser {
  final FirebaseRepository repository;
  GetCreateCurrentUser({this.repository});

  Future<void> call(String email, String imgUrl, String userName) async {
    repository.getCreateCurrentUser(email, imgUrl, userName);
  }
}
