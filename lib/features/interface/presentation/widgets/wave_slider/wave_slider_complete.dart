import 'package:capimobile/features/interface/presentation/widgets/wave_slider/wave_slider_version2.dart';
import 'package:flutter/material.dart';

class WaveSliderComplete extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final double currentValue;
  final String label;
  final int displayedMax, displayedMin;

  WaveSliderComplete(
      {this.displayedMin,
      this.displayedMax,
      @required this.onChanged,
      @required this.currentValue,
      this.label = ''});
  @override
  _WaveSliderCompleteState createState() => _WaveSliderCompleteState();
}

class _WaveSliderCompleteState extends State<WaveSliderComplete> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Theme.of(context).accentColor),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: WaveSlider(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  displayTrackball: true,
                  onChanged: widget.onChanged,
                  currentPercentage: widget.currentValue,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(
                '${(convertRange((widget.currentValue * 100).toInt(), widget.displayedMax, widget.displayedMin)).toInt()}%',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'SourceSansPro'),
              ),
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}

int convertRange(int original, int max, int min) {
  if (max == null || min == null) return original;
  double position = (max - min).toDouble() * (original / 100);
  return ((min).toDouble() + position).round();
}

double convertRangeInverse(int converted, int max, int min) {
  if (max == null || min == null) return converted.toDouble();
  if (converted > max) return 100;
  if (converted < min) return 0;
  int maxfinal = max ?? 100;
  int minFinal = min ?? 0;
  //

  //1 unit value

  double unitValue = 1 / (maxfinal - minFinal);
  //int resolution = min-convertRange(unitValue.toInt()+min, maxfinal, minFinal)

  double tmp = (((converted - minFinal) / (maxfinal - minFinal)) * 100);
  while (converted < convertRange(tmp.toInt(), max, min)) {
    tmp -= unitValue;
  }

  while (converted > convertRange(tmp.toInt(), max, min)) {
    tmp += unitValue;
  }

  return tmp;
}
