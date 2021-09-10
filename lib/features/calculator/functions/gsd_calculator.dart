import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getGSDString() {
  return (getGsdDouble() == null)
      ? d.UnavailableData
      : '${(getGsdDouble() * 100).round() / 100} cm/px';
}

bool isGSDAvailable() => getGsdDouble() != null;

double getGsdDouble() {
  /*
  Relevant data:
    sensor width
    distance to outcrop
    focal length
    image width
   */
  double sw = pdfDataSrc.sensorWidthMm;
  double h = pdfDataSrc.outcropDistance;
  double fl = pdfDataSrc.focalLength;
  int imW = pdfDataSrc.sensorWidthPx;

  if (pdfDataSrc.gsd == null) {
    if (sw == null || h == null || fl == null || imW == null) {
      //cannot be calculated
      return null;
    } else {
      return (sw * h * 100) / (fl * imW.toDouble());
    }
  } else {
    return pdfDataSrc.gsd;
  }
}
