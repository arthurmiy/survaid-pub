import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/gsd_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getDistanceToOutcrop() {
  /*
  Relevant data:
    gsd
    sensor width
    focal length
    image width
   */
  double sw = pdfDataSrc.sensorWidthMm;
  double gsd = getGsdDouble();
  double fl = pdfDataSrc.focalLength;
  int imW = pdfDataSrc.sensorWidthPx;

  if (pdfDataSrc.outcropDistance != null) {
    return '${pdfDataSrc.outcropDistance} m';
  }

  if (sw == null || gsd == null || fl == null || imW == null) {
    //cannot be calculated
    return d.UnavailableData;
  } else {
    return '${((gsd * fl * imW.toDouble()) / (sw)).round() / 100} m';
  }
}
