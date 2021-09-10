import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/footprint_dimensions_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';
import 'package:capimobile/features/interface/presentation/widgets/data_getters/photo_orientation_select.dart';

import 'gsd_calculator.dart';

String getPhotoSpacing() {
  return (getPhotoSpaceDouble() == null)
      ? d.UnavailableData
      : '${(getPhotoSpaceDouble() * 100).round() / 100} m';
}

double getPhotoSpaceDouble() {
  // double imgDimension, overlap, photoDistance;
  // if (pdfDataSrc.photoOrientation ==
  //     PhotoOrientationSelector.LANDSCAPE.toString()) {
  //   if (getGsdDouble() == null ||
  //       pdfDataSrc.sensorWidthMm == null ||
  //       pdfDataSrc.sideOverlap == null) {
  //     return null;
  //   } else {
  //     //Landscape
  //     imgDimension = (getGsdDouble() * pdfDataSrc.sensorWidthMm) / 100;
  //     overlap = pdfDataSrc.sideOverlap.toDouble(); //todo verify
  //   }
  // } else {
  //   if (getGsdDouble() == null ||
  //       pdfDataSrc.sensorHeightMm == null ||
  //       pdfDataSrc.sideOverlap == null) {
  //     return null;
  //   } else {
  //     //Portrait
  //     imgDimension = (getGsdDouble() * pdfDataSrc.sensorHeightMm) / 100;
  //     overlap = pdfDataSrc.sideOverlap.toDouble(); //todo verify
  //   }
  // }
  //
  // photoDistance = imgDimension * overlap;
  // return photoDistance;

  if (getFootPrintWidthDouble() == null || pdfDataSrc.sideOverlap == null) {
    return null;
  } else {
    return getFootPrintWidthDouble() * (1 - pdfDataSrc.sideOverlap / 100);
  }
}
