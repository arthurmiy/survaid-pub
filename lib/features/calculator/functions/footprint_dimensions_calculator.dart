import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/gsd_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/photo_orientation_select.dart';

String getFootPrintWidth() {
  /*
  Relevant Data
    GSD
    image width
   */

  if (getFootPrintWidthDouble() == null) {
    return d.UnavailableData;
  } else {
    return '${((getFootPrintWidthDouble() * 100)).round() / 100} m';
  }
}

double getFootPrintWidthDouble() {
  /*
  Relevant Data
    GSD
    image width
   */
  int imW;
  if (pdfDataSrc.photoOrientation ==
      PhotoOrientationSelector.LANDSCAPE.toString()) {
    //landscape
    imW = pdfDataSrc.sensorWidthPx;
  } else {
    //portrait
    imW = pdfDataSrc.sensorHeightPx;
  }

  double gsd = getGsdDouble();

  if (imW == null || gsd == null) {
    return null;
  } else {
    return ((gsd * imW)) / 100;
  }
}

String getFootPrintHeight() {
  /*
  Relevant Data
    GSD
    image width
   */
  if (getFootPrintHeightDouble() == null) {
    return d.UnavailableData;
  } else {
    return '${((getFootPrintHeightDouble() * 100)).round() / 100} m';
  }
}

double getFootPrintHeightDouble() {
  /*
  Relevant Data
    GSD
    image width
   */
  int imH;
  if (pdfDataSrc.photoOrientation ==
      PhotoOrientationSelector.LANDSCAPE.toString()) {
    //landscape
    imH = pdfDataSrc.sensorHeightPx;
  } else {
    //portrait
    imH = pdfDataSrc.sensorWidthPx;
  }

  double gsd = getGsdDouble();

  if (imH == null || gsd == null) {
    return null;
  } else {
    return (gsd * imH).round() / 100;
  }
}
