import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class GetCurrentUid {
  final FirebaseRepository repository;
  GetCurrentUid({this.repository});

  Future<String> call() => repository.getCurrentUid();
}
