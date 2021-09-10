import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/usecases/resend_confirmation_email_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/sign_out_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/signin_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SingInUsecase singInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;
  final ResendConfirmationEmailUsecase resendConfirmationEmailUsecase;

  LoginCubit(
      {this.singInUsecase,
      this.signUpUsecase,
      this.signOutUsecase,
      this.resendConfirmationEmailUsecase})
      : super(LoginInitial());

  Future<void> resendConfirmationEmail(String email, String password) async {
    resendConfirmationEmailUsecase.call(email, password);
  }

  Future<void> signIn({String email, String password, String method}) async {
    emit(LoginLoading());
    try {
      UserModel tmp = await singInUsecase.call(email, password, method);
      if (tmp.email == 'error') {
        emit(LoginFailure(error: d.LoginError));
      } else if (tmp.email == 'verify') {
        emit(LoginFailure(error: d.EmailNotVerified));
      }
    } on SocketException catch (e) {
      emit(LoginFailure(error: e.message));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> signUp({String email, String password, String userName}) async {
    try {
      emit(RegisterLoading());
      await signUpUsecase.call(email, password, userName);
      emit(RegisterSuccess());
    } on SocketException catch (e) {
      emit(RegisterFailure(error: e.message));
    }
  }

  Future<void> signOut() async {
    try {
      await signOutUsecase.call();
      emit(SignedOutSuccess());
    } on SocketException catch (_) {}
  }
}
