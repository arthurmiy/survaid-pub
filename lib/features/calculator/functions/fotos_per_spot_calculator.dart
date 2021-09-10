import 'package:capimobile/features/interface/presentation/screens/view_survey.dart';

String getPhotosPerSpot() {
  bool h = pdfDataSrc.horizontalStructures;
  bool v = pdfDataSrc.verticalStructures;
  int total = 1;
  total += h ? 2 : 0;
  total += v ? 2 : 0;

  return total.toString();
}

int getPhotosPerSpotInt() {
  bool h = pdfDataSrc.horizontalStructures;
  bool v = pdfDataSrc.verticalStructures;
  int total = 1;
  total += h ? 2 : 0;
  total += v ? 2 : 0;

  return total;
}
