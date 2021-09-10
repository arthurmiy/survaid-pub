import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/photo_spacing_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getImagesPerLineAmount() {
  /*
  Relevant data
    GSD
    Sensor width / Sensor height
    img width / imgHeight
    side overlap / front / overlap
   */
  if (getImagesPerLineAmountInt() == null) {
    return d.UnavailableData;
  } else if (getImagesPerLineAmountInt() < 0) {
    return d.OVERLAP_ERROR;
  } else {
    return getImagesPerLineAmountInt().toString();
  }
}

int getImagesPerLineAmountInt() {
  /*
  Relevant data
    GSD
    Sensor width / Sensor height
    img width / imgHeight
    side overlap / front / overlap
   */
  int numberOfImages;
  if (pdfDataSrc.width == null || getPhotoSpaceDouble() == null) {
    return null;
  } else if (getPhotoSpaceDouble() == 0) {
    //infinity
    return -1;
  } else {
    numberOfImages = (pdfDataSrc.width / getPhotoSpaceDouble()).ceil() + 2;
    return numberOfImages;
  }
}
