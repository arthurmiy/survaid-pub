part of 'camera_cubit.dart';

@immutable
abstract class CameraState extends Equatable {}

class CameraInitial implements CameraState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CameraLoading implements CameraState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CameraLoaded implements CameraState {
  final List<CameraEntity> cameras;

  CameraLoaded({this.cameras});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CameraSaving implements CameraState {
  final List<CameraEntity> cameras;

  CameraSaving({this.cameras});

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CameraSaved implements CameraState {
  CameraSaved();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}
