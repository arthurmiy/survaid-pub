part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({this.error});

  @override
  List<Object> get props => [this.error];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class RegisterFailure extends LoginState {
  final String error;
  RegisterFailure({this.error});

  @override
  List<Object> get props => [this.error];
}

class RegisterSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class SignedOutSuccess extends LoginState {
  @override
  List<Object> get props => [];
}
