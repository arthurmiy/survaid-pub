import 'package:capimobile/core/language/language_list.dart';
import 'package:capimobile/features/calculator/functions/fotos_per_spot_calculator.dart';
import 'package:capimobile/features/calculator/functions/images_number_per_line_calculator.dart';
import 'package:capimobile/features/calculator/functions/number_of_lines_calculator.dart';

String getPhotosAmount() {
  if (getImagesPerLineAmountInt() == null || getLineAmountInt() == null) {
    return d.UnavailableData;
  } else {
    return (getImagesPerLineAmountInt() *
            getLineAmountInt() *
            getPhotosPerSpotInt())
        .toString();
  }
}
