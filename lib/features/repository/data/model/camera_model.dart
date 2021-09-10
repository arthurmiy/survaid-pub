import 'package:capimobile/features/repository/domain/entities/camera_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CameraModel extends CameraEntity {
  CameraModel({
    String name,
    String cameraMaker,
    String cameraModel,
    double sensorWidthMm,
    double sensorHeightMm,
    int sensorWidthPx,
    int sensorHeightPx,
    double focalLength,
  }) : super(
          name,
          cameraMaker,
          cameraModel,
          sensorWidthMm,
          sensorHeightMm,
          sensorWidthPx,
          sensorHeightPx,
          focalLength,
        );

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(
      name: json['name'],
      cameraMaker: json['cameraMaker'],
      cameraModel: json['cameraModel'],
      sensorWidthMm: json['sensorWidthMm'].toDouble(),
      sensorHeightMm: json['sensorHeightMm'].toDouble(),
      sensorWidthPx: json['sensorWidthPx'],
      sensorHeightPx: json['sensorHeightPx'],
      focalLength: json['focalLength'].toDouble(),
    );
  }
  factory CameraModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return CameraModel(
      name: documentSnapshot.data()['name'],
      cameraMaker: documentSnapshot.data()['cameraMaker'],
      cameraModel: documentSnapshot.data()['cameraModel'],
      sensorWidthMm: documentSnapshot.data()['sensorWidthMm'].toDouble(),
      sensorHeightMm: documentSnapshot.data()['sensorHeightMm'].toDouble(),
      sensorWidthPx: documentSnapshot.data()['sensorWidthPx'],
      sensorHeightPx: documentSnapshot.data()['sensorHeightPx'],
      focalLength: documentSnapshot.data()['focalLength'].toDouble(),
    );
  }
  factory CameraModel.fromEntity(CameraEntity entity) {
    return CameraModel(
      name: entity.name,
      cameraMaker: entity.cameraMaker,
      cameraModel: entity.cameraModel,
      sensorWidthMm: entity.sensorWidthMm,
      sensorHeightMm: entity.sensorHeightMm,
      sensorWidthPx: entity.sensorWidthPx,
      sensorHeightPx: entity.sensorHeightPx,
      focalLength: entity.focalLength,
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "cameraMaker": cameraMaker,
      "cameraModel": cameraModel,
      "sensorWidthMm": sensorWidthMm,
      "sensorHeightMm": sensorHeightMm,
      "sensorWidthPx": sensorWidthPx,
      "sensorHeightPx": sensorHeightPx,
      "focalLength": focalLength,
    };
  }
}
