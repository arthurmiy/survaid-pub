import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/distance_to_outcrop_calculator.dart';
import 'package:capimobile/features/calculator/functions/footprint_dimensions_calculator.dart';
import 'package:capimobile/features/calculator/functions/fotos_per_spot_calculator.dart';
import 'package:capimobile/features/calculator/functions/gsd_calculator.dart';
import 'package:capimobile/features/calculator/functions/line_spacing_calculator.dart';
import 'package:capimobile/features/calculator/functions/number_of_lines_calculator.dart';
import 'package:capimobile/features/calculator/functions/number_of_photos_calculator.dart';
import 'package:capimobile/features/calculator/functions/photo_spacing_calculator.dart';
import 'package:capimobile/features/calculator/functions/process_time_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

class sfy {
  static String get outcropWidth =>
      (pdfDataSrc.width == null) ? d.UnavailableData : '${pdfDataSrc.width} m';
  static String get outcropHeigth => (pdfDataSrc.height == null)
      ? d.UnavailableData
      : '${pdfDataSrc.height} m';
  static String get outcropDist => getDistanceToOutcrop();
  static String get gsd => getGSDString();
  static String get sensorHeightMm => (pdfDataSrc.sensorHeightMm == null)
      ? d.UnavailableData
      : '${pdfDataSrc.sensorHeightMm} mm';
  static String get sensorWidthMm => (pdfDataSrc.sensorWidthMm == null)
      ? d.UnavailableData
      : '${pdfDataSrc.sensorWidthMm} mm';
  static String get sensorWidthPx => nullCheck(pdfDataSrc.sensorWidthPx, 'px');
  static String get sensorHeightPx =>
      nullCheck(pdfDataSrc.sensorHeightPx, 'px');
  static String get focalLength => nullCheck(pdfDataSrc.focalLength, 'mm');

  static String get footprintHeight => getFootPrintHeight();
  static String get footprintWidth => getFootPrintWidth();
  static String get photosPerSpot => getPhotosPerSpot();
  static String get lineSpacing => getLineSpace();
  static String get photosAmount => getPhotosAmount();
  static String get linesAmount => getLineAmount();

  static String get photoSpacing => getPhotoSpacing();
  static String get processTime => getProcessTime();

  // static String get   => nullCheck(pdfDataSrc., '');

  static String nullCheck(dynamic value, String unit) {
    return (value == null) ? d.UnavailableData : '$value $unit';
  }
}
