import 'package:capimobile/features/interface/presentation/widgets/wave_slider/wave_painter.dart';
import 'package:flutter/material.dart';

class WaveSlider extends StatefulWidget {
  /// Creates a wave slider.
  ///
  /// When the state of the slider is changed the widget calls the [onChanged] callback.
  const WaveSlider({
    this.sliderHeight = 50.0,
    this.color = Colors.black,
    this.onChangeEnd,
    this.onChangeStart,
    @required this.currentPercentage,
    @required this.onChanged,
    this.displayTrackball = false,
  })  : assert(onChanged != null),
        assert(color != null),
        assert(sliderHeight != null),
        assert(sliderHeight >= 50 && sliderHeight <= 600),
        assert(currentPercentage >= 0 && currentPercentage <= 1);

  /// The height of the slider can be set by specifying a [sliderHeight] - default is 50.0
  final double sliderHeight;

  final double currentPercentage;

  /// The color of the slider can be set by specifying a [color] - default is black.
  final Color color;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ///
  /// Returns a percentage value between 0 and 100 for the current drag position.
  final ValueChanged<double> onChanged;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double> onChangeStart;

  /// Called when the user is done selecting a new value for the slider.
  final ValueChanged<double> onChangeEnd;

  /// Display a trackball below the line on the current position as a visual indicator
  final bool displayTrackball;

  @override
  _WaveSliderState createState() => _WaveSliderState();
}

class _WaveSliderState extends State<WaveSlider>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0.0;
  double _dragPercentage = 0.0;
  double _sliderWidth = 0;

  WaveSliderController _slideController;

  @override
  void initState() {
    super.initState();
    _slideController = WaveSliderController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _handleChanged(double val) {
    if (widget.onChanged != null) {
      widget.onChanged(val);
    }
  }

  void _handleChangeStart(double val) {
    if (widget.onChangeStart != null) {
      widget.onChangeStart(val);
    }
  }

  void _handleChangeEnd(double val) {
    if (widget.onChangeEnd != null) {
      widget.onChangeEnd(val);
    }
  }

  void _updateDragPosition(Offset val) {
    double newDragPosition = 0.0;
    if (val.dx <= 0.0) {
      newDragPosition = 0.0;
    } else if (val.dx >= _sliderWidth) {
      newDragPosition = _sliderWidth;
    } else {
      newDragPosition = val.dx;
    }

    setState(() {
      _dragPosition = newDragPosition;
      _dragPercentage = _dragPosition / _sliderWidth;
    });
  }

  void _onDragStart(BuildContext context, DragStartDetails start) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(start.globalPosition);
    _slideController.setStateToStart();
    _updateDragPosition(localOffset);
    _handleChangeStart(_dragPercentage);
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    final RenderBox box = context.findRenderObject();
    final Offset localOffset = box.globalToLocal(update.globalPosition);
    _slideController.setStateToSliding();
    _updateDragPosition(localOffset);
    _handleChanged(_dragPercentage);
  }

  void _onDragEnd(BuildContext context, DragEndDetails end) {
    _slideController.setStateToStopping();
    setState(() {});
    _handleChangeEnd(_dragPercentage);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _sliderWidth = constraints.maxWidth;
        // final double _safePadding = widget.sliderHeight / 4;
        return GestureDetector(
          child: Container(
            width: _sliderWidth,
            height: widget.sliderHeight,
            child: CustomPaint(
              painter: WavePainter(
                color: widget.color,
                sliderPosition: widget.currentPercentage * _sliderWidth,
                dragPercentage: _dragPercentage,
                sliderState: _slideController.state,
                animationProgress: _slideController.progress,
                displayTrackball: widget.displayTrackball,
              ),
            ),
          ),
          onHorizontalDragStart: (DragStartDetails start) =>
              _onDragStart(context, start),
          onHorizontalDragUpdate: (DragUpdateDetails update) =>
              _onDragUpdate(context, update),
          onHorizontalDragEnd: (DragEndDetails end) => _onDragEnd(context, end),
        );
      },
    );
  }
}

class WaveSliderController extends ChangeNotifier {
  WaveSliderController({@required TickerProvider vsync})
      : controller = AnimationController(vsync: vsync) {
    controller
      ..addListener(_onProgressUpdate)
      ..addStatusListener(_onStatusUpdate);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final AnimationController controller;
  SliderState _state = SliderState.resting;

  void _onProgressUpdate() {
    notifyListeners();
  }

  void _onStatusUpdate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _onTransitionCompleted();
    }
  }

  void _onTransitionCompleted() {
    if (_state == SliderState.stopping) {
      setStateToResting();
    }
  }

  double get progress => controller.value;

  SliderState get state => _state;

  void _startAnimation() {
    controller.duration = Duration(milliseconds: 500);
    controller.forward(from: 0.0);
    notifyListeners();
  }

  void setStateToStart() {
    _startAnimation();
    _state = SliderState.starting;
  }

  void setStateToStopping() {
    _startAnimation();
    _state = SliderState.stopping;
  }

  void setStateToSliding() {
    _state = SliderState.sliding;
  }

  void setStateToResting() {
    _state = SliderState.resting;
  }
}

enum SliderState {
  starting,
  resting,
  sliding,
  stopping,
}
