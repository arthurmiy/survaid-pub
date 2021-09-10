import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/footprint_dimensions_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getLineSpace() {
  return (getLineSpaceDouble() == null)
      ? d.UnavailableData
      : '${(getLineSpaceDouble() * 100).round() / 100} m';
}

double getLineSpaceDouble() {
  // double imgDimension, overlap, lineDistance;
  // if (pdfDataSrc.photoOrientation ==
  //     PhotoOrientationSelector.LANDSCAPE.toString()) {
  //   if (getGsdDouble() == null ||
  //       pdfDataSrc.sensorHeightMm == null ||
  //       pdfDataSrc.frontOverlap == null) {
  //     return null;
  //   } else {
  //     //Landscape
  //     imgDimension = (getGsdDouble() * pdfDataSrc.sensorHeightMm) / 100;
  //     overlap = pdfDataSrc.frontOverlap.toDouble();
  //   }
  // } else {
  //   if (getGsdDouble() == null ||
  //       pdfDataSrc.sensorWidthMm == null ||
  //       pdfDataSrc.frontOverlap == null) {
  //     return null;
  //   } else {
  //     //Portrait
  //     imgDimension = (getGsdDouble() * pdfDataSrc.sensorWidthMm) / 100;
  //     overlap = pdfDataSrc.frontOverlap.toDouble();
  //   }
  // }
  //
  // lineDistance = imgDimension * (1-overlap);
  // return lineDistance;

  if (getFootPrintHeightDouble() == null || pdfDataSrc.frontOverlap == null) {
    return null;
  } else {
    return getFootPrintHeightDouble() * (1 - pdfDataSrc.frontOverlap / 100);
  }
}
