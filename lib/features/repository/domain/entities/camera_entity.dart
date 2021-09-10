import 'package:equatable/equatable.dart';

class CameraEntity extends Equatable {
  final String name;
  final String cameraMaker;
  final String cameraModel;
  final double sensorWidthMm;
  final double sensorHeightMm;
  final int sensorWidthPx;
  final int sensorHeightPx;
  final double focalLength;

  CameraEntity(
    this.name,
    this.cameraMaker,
    this.cameraModel,
    this.sensorWidthMm,
    this.sensorHeightMm,
    this.sensorWidthPx,
    this.sensorHeightPx,
    this.focalLength,
  );

  @override
  List<Object> get props => [
        name,
        cameraMaker,
        cameraModel,
        sensorWidthMm,
        sensorHeightMm,
        sensorWidthPx,
        sensorHeightPx,
        focalLength,
      ];
}
