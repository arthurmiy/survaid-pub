import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SurveyDataEntity extends Equatable {
  final String userId;
  final Timestamp time;
  final String surveyName;
  final double width;
  final double height;
  final double outcropDistance;
  final String cameraModel;
  final double sensorWidthMm;
  final double sensorHeightMm;
  final int sensorWidthPx;
  final int sensorHeightPx;
  final double focalLength;
  final bool horizontalStructures;
  final bool verticalStructures;
  final double gsd;
  final String photoOrientation;
  final int sideOverlap;
  final int frontOverlap;

  SurveyDataEntity(
    this.userId,
    this.time,
    this.surveyName,
    this.width,
    this.height,
    this.outcropDistance,
    this.cameraModel,
    this.sensorWidthMm,
    this.sensorHeightMm,
    this.sensorWidthPx,
    this.sensorHeightPx,
    this.focalLength,
    this.horizontalStructures,
    this.verticalStructures,
    this.gsd,
    this.photoOrientation,
    this.sideOverlap,
    this.frontOverlap,
  );

  @override
  List<Object> get props => [
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
        frontOverlap
      ];

  SurveyDataEntity copyWith(
          {userId,
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
          frontOverlap}) =>
      SurveyDataEntity(
        userId ?? this.userId,
        time ?? this.time,
        surveyName ?? this.surveyName,
        width ?? this.width,
        height ?? this.height,
        outcropDistance ?? this.outcropDistance,
        cameraModel ?? this.cameraModel,
        sensorWidthMm ?? this.sensorWidthMm,
        sensorHeightMm ?? this.sensorHeightMm,
        sensorWidthPx ?? this.sensorWidthPx,
        sensorHeightPx ?? this.sensorHeightPx,
        focalLength ?? this.focalLength,
        horizontalStructures ?? this.horizontalStructures,
        verticalStructures ?? this.verticalStructures,
        gsd ?? this.gsd,
        photoOrientation ?? this.photoOrientation,
        sideOverlap ?? this.sideOverlap,
        frontOverlap ?? this.frontOverlap,
      );

  String toString() {
    return '${this.surveyName ?? '\$'}/${this.width ?? '\$'}/${this.height ?? '\$'}/${this.outcropDistance ?? '\$'}/${this.sensorWidthMm ?? '\$'}/${this.sensorHeightMm ?? '\$'}/${this.sensorWidthPx ?? '\$'}/${this.sensorHeightPx ?? '\$'}/${this.focalLength ?? '\$'}/${this.horizontalStructures ? 1 : 0}/${this.verticalStructures ? 1 : 0}/${this.gsd ?? '\$'}/${this.photoOrientation ?? '\$'}/${this.sideOverlap}/${this.frontOverlap}/';
  }

  factory SurveyDataEntity.fromString(String input) {
    List<String> params = input.split('/');
    print(params.length);
    if (params.length == 16) {
      return SurveyDataEntity(
        ' ',
        //userId
        Timestamp.now(),
        //time
        params[0],
        //surveyName
        double.tryParse(params[1]),
        //width
        double.tryParse(params[2]),
        //height
        double.tryParse(params[3]),
        //outcropDistance
        null,
        //cameraModel
        double.tryParse(params[4]),
        //sensorWidthMm
        double.tryParse(params[5]),
        //sensorHeightMm
        int.tryParse(params[6]),
        //sensorWidthPx
        int.tryParse(params[7]),
        //sensorHeightPx
        double.tryParse(params[8]),
        //focalLength
        double.tryParse(params[9]) == 1,
        //horizontalStructures
        double.tryParse(params[10]) == 1,
        //verticalStructures
        double.tryParse(params[11]),
        //gsd
        params[12],
        //photoOrientation
        int.tryParse(params[13]),
        //sideOverlap
        int.tryParse(params[14]), //frontOverlap
      );
    } else {
      return SurveyDataEntity('', Timestamp.now(), '\$Error', null, null, null,
          '', null, null, null, null, null, false, false, null, '', 60, 30);
    }
  }
}
