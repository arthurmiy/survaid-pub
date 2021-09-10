part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial implements UserState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class UserLoading implements UserState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class UserLoaded implements UserState {
  final UserEntity user;

  UserLoaded({this.user});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class UserLoadingError implements UserState {
  final String error;

  UserLoadingError({this.error});

  @override
  List<Object> get props => [this.error];

  @override
  bool get stringify => false;
}
