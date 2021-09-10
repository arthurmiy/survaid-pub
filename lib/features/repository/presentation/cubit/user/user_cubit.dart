import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capimobile/features/repository/data/model/user_model.dart';
import 'package:capimobile/features/repository/domain/entities/user_entity.dart';
import 'package:capimobile/features/repository/domain/usecases/get_current_uid.dart';
import 'package:capimobile/features/repository/domain/usecases/get_logged_user_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/listen_user_events.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetLoggedUser getLoggedUserUsecase;
  final GetCurrentUid getCurrentUidUsecase;
  final ListenUserEventsUsecase listenUserEventsUsecase;

  UserCubit({
    this.getLoggedUserUsecase,
    this.getCurrentUidUsecase,
    this.listenUserEventsUsecase,
  }) : super(UserInitial());

  Future<void> appStart() async {
    try {
      Stream<UserModel> userListener = listenUserEventsUsecase.call();

      userListener.listen((event) {
        emit(UserLoaded(user: event));
      });
    } on SocketException catch (e) {
      emit(UserLoadingError(error: e.message));
    }
  }

  Future<void> getLoggedUser() async {
    try {
      UserEntity user = await getLoggedUserUsecase.call();
    } on SocketException catch (e) {
      emit(UserLoadingError(error: e.message));
    }
  }

  Future<void> getCurrentUid() async {
    try {
      await getCurrentUidUsecase.call();
    } on SocketException catch (_) {}
  }
}
