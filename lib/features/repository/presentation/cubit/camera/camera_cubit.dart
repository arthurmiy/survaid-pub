import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:capimobile/features/repository/domain/usecases/append_new_camera_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/delete_camera_usecase.dart';
import 'package:capimobile/features/repository/domain/usecases/get_cameras_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  //usecases
  final GetCamerasUsecase getCamerasUsecase;
  final AppendNewCameraUsecase appendNewCameraUsecase;
  final DeleteCameraUsecase deleteCameraUsecase;

  CameraCubit(
      {this.getCamerasUsecase,
      this.appendNewCameraUsecase,
      this.deleteCameraUsecase})
      : super(CameraInitial());

  Future<void> appendNewCamera({CameraEntity cameraData}) async {
    try {
      emit(CameraSaving());
      await appendNewCameraUsecase.call(cameraData);
      emit(CameraSaved());
    } on SocketException catch (_) {}
  }

  Future<void> getCameras() async {
    try {
      emit(CameraLoading());
      final cameras = getCamerasUsecase.call();
      emit(CameraLoaded(cameras: []));
      cameras.listen((cam) {
        emit(CameraLoaded(cameras: cam));
      });
    } on SocketException catch (_) {}
  }

  Future<void> deleteCamera(String cameraName) async {
    await deleteCameraUsecase.call(cameraName);
  }
}
