import 'package:capimobile/features/repository/domain/repositories/firebase_repository.dart';

class ResendConfirmationEmailUsecase {
  final FirebaseRepository repository;
  ResendConfirmationEmailUsecase({this.repository});

  Future<void> call(String email, String password) async {
    return repository.resendConfirmationEmail(email, password);
  }
}
