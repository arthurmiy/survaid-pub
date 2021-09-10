import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class IsSingningUsecase {
  final FirebaseRepository repository;
  IsSingningUsecase({this.repository});
  Future<bool> call() => repository.isSignIn();
}
