import 'package:capimobile/features/repository/domain/entities/survey_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyDataModel extends SurveyDataEntity {
  SurveyDataModel({
    String userId,
    Timestamp time,
    String surveyName,
    double width,
    double height,
    double outcropDistance,
    String cameraModel,
    double sensorWidthMm,
    double sensorHeightMm,
    int sensorWidthPx,
    int sensorHeightPx,
    double focalLength,
    bool horizontalStructures,
    bool verticalStructures,
    double gsd,
    String photoOrientation,
    int sideOverlap,
    int frontOverlap,
  }) : super(
          userId,
          time,
          surveyName,
          width,
          height,
          outcropDistance,
          cameraModel,
          sensorWidthMm,
          sensorHeightMm,
          sensorWidthPx,
          sensorHeightPx,
          focalLength,
          horizontalStructures,
          verticalStructures,
          gsd,
          photoOrientation,
          sideOverlap,
          frontOverlap,
        );

  factory SurveyDataModel.fromJson(Map<String, dynamic> json) {
    return SurveyDataModel(
      userId: json['userId'],
      time: json['time'],
      surveyName: json['surveyName'],
      width: json['width'] == null ? null : json['width'].toDouble(),
      height: json['height'] == null ? null : json['height'].toDouble(),
      outcropDistance: json['outcropDistance'] == null
          ? null
          : json['outcropDistance'].toDouble(),
      cameraModel: json['cameraModel'],
      sensorWidthMm: json['sensorWidthMm'] == null
          ? null
          : json['sensorWidthMm'].toDouble(),
      sensorHeightMm: json['sensorHeightMm'] == null
          ? null
          : json['sensorHeightMm'].toDouble(),
      sensorWidthPx: json['sensorWidthPx'],
      sensorHeightPx: json['sensorHeightPx'],
      focalLength:
          json['focalLength'] == null ? null : json['focalLength'].toDouble(),
      horizontalStructures: json['horizontalStructures'],
      verticalStructures: json['verticalStructures'],
      gsd: json['gsd'],
      photoOrientation: json['photoOrientation'],
      sideOverlap: json['sideOverlap'],
      frontOverlap: json['frontOverlap'],
    );
  }

  factory SurveyDataModel.fromEntity(SurveyDataEntity entity) {
    return SurveyDataModel(
      userId: entity.userId,
      time: entity.time,
      surveyName: entity.surveyName,
      width: entity.width,
      height: entity.height,
      outcropDistance: entity.outcropDistance,
      cameraModel: entity.cameraModel,
      sensorWidthMm: entity.sensorWidthMm,
      sensorHeightMm: entity.sensorHeightMm,
      sensorWidthPx: entity.sensorWidthPx,
      sensorHeightPx: entity.sensorHeightPx,
      focalLength: entity.focalLength,
      horizontalStructures: entity.horizontalStructures,
      verticalStructures: entity.verticalStructures,
      gsd: entity.gsd,
      photoOrientation: entity.photoOrientation,
      sideOverlap: entity.sideOverlap,
      frontOverlap: entity.frontOverlap,
    );
  }

  factory SurveyDataModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return SurveyDataModel(
      userId: documentSnapshot.data()['userId'],
      time: documentSnapshot.data()['time'],
      surveyName: documentSnapshot.data()['surveyName'],
      width: documentSnapshot.data()['width'] == null
          ? null
          : documentSnapshot.data()['width'].toDouble(),
      height: documentSnapshot.data()['height'] == null
          ? null
          : documentSnapshot.data()['height'].toDouble(),
      outcropDistance: documentSnapshot.data()['outcropDistance'] == null
          ? null
          : documentSnapshot.data()['outcropDistance'].toDouble(),
      cameraModel: documentSnapshot.data()['cameraModel'],
      sensorWidthMm: documentSnapshot.data()['sensorWidthMm'] == null
          ? null
          : documentSnapshot.data()['sensorWidthMm'].toDouble(),
      sensorHeightMm: documentSnapshot.data()['sensorHeightMm'] == null
          ? null
          : documentSnapshot.data()['sensorHeightMm'].toDouble(),
      sensorWidthPx: documentSnapshot.data()['sensorWidthPx'],
      sensorHeightPx: documentSnapshot.data()['sensorHeightPx'],
      focalLength: documentSnapshot.data()['focalLength'] == null
          ? null
          : documentSnapshot.data()['focalLength'].toDouble(),
      horizontalStructures: documentSnapshot.data()['horizontalStructures'],
      verticalStructures: documentSnapshot.data()['verticalStructures'],
      gsd: documentSnapshot.data()['gsd'] == null
          ? null
          : documentSnapshot.data()['gsd'].toDouble(),
      photoOrientation: documentSnapshot.data()['photoOrientation'],
      sideOverlap: documentSnapshot.data()['sideOverlap'],
      frontOverlap: documentSnapshot.data()['frontOverlap'],
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "userId": userId,
      "time": time,
      "surveyName": surveyName,
      "width": width,
      "height": height,
      "outcropDistance": outcropDistance,
      "cameraModel": cameraModel,
      "sensorWidthMm": sensorWidthMm,
      "sensorHeightMm": sensorHeightMm,
      "sensorWidthPx": sensorWidthPx,
      "sensorHeightPx": sensorHeightPx,
      "focalLength": focalLength,
      "horizontalStructures": horizontalStructures,
      "verticalStructures": verticalStructures,
      "gsd": gsd,
      "photoOrientation": photoOrientation,
      "sideOverlap": sideOverlap,
      "frontOverlap": frontOverlap,
    };
  }
}
