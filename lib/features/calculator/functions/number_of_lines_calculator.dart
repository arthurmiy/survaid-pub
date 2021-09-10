import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/gsd_calculator.dart';
import 'package:capimobile/features/calculator/functions/line_spacing_calculator.dart';
import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getLineAmount() {
  /*
  Relevant data
    GSD
    Sensor width / Sensor height
    img width / imgHeight
    side overlap / front / overlap
   */
  if (getLineAmountInt() == null) {
    return d.UnavailableData;
  } else if (getLineAmountInt() < 0) {
    return d.OVERLAP_ERROR;
  } else {
    return getLineAmountInt().toString();
  }
}

int getLineAmountInt() {
  /*
  Relevant data
    GSD
    Sensor width / Sensor height
    img width / imgHeight
    side overlap / front / overlap
   */
  int numberOfLines;
  if (pdfDataSrc.height == null || getLineSpaceDouble() == null) {
    return null;
  } else if (getLineSpaceDouble() == 0) {
    //infinity
    return -1;
  } else {
    numberOfLines = (pdfDataSrc.height / getLineSpaceDouble()).ceil() + 1;
    return numberOfLines;
  }
}
