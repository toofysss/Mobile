library marquee;

import 'dart:async';
import 'package:flutter/material.dart';

class _IntegralCurve extends Curve {
  static double delta = 0.01;

  const _IntegralCurve._(this.original, this.integral, this._values);
  final Curve original;
  final double integral;
  final Map<double, double> _values;
  factory _IntegralCurve(Curve original) {
    double integral = 0.0;
    final values = <double, double>{};

    for (double t = 0.0; t <= 1.0; t += delta) {
      integral += original.transform(t) * delta;
      values[t] = integral;
    }
    values[1.0] = integral;
    for (final double t in values.keys) {
      values[t] = values[t]! / integral;
    }

    return _IntegralCurve._(original, integral, values);
  }

  @override
  double transform(double t) {
    if (t < 0) return 0.0;
    for (final key in _values.keys) {
      if (key > t) return _values[key]!;
    }
    return 1.0;
  }
}

class Marquee extends StatefulWidget {
  final String text;
  final Duration accelerationDuration;
  const Marquee({
    super.key,
    required this.text,
    required this.accelerationDuration,
    Curve accelerationCurve = Curves.decelerate,
  });

  @override
  State<StatefulWidget> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late double _startPosition;
  late double _accelerationTarget;
  late double _linearTarget;
  late double _decelerationTarget;

  late Duration _totalDuration;

  Duration get _accelerationDuration => widget.accelerationDuration;
  Duration? _linearDuration;
  Duration get _decelerationDuration => Duration.zero;

  bool _running = false;
  bool _isOnPause = false;
  bool get isDone => false;
  bool get showFading => !_isOnPause;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_running) {
        _running = true;
        if (_controller.hasClients) {
          _controller.jumpTo(_startPosition);
          await Future<void>.delayed(Duration.zero);
          Future.doWhile(_scroll);
        }
      }
    });
  }

  Future<bool> _scroll() async {
    await _makeRoundTrip();
    return _running && !isDone && _controller.hasClients;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget as Marquee);
  }

  @override
  void dispose() {
    _running = false;
    super.dispose();
  }

  void _initialize(BuildContext context) {
    final totalLength = _getTextWidth(context) + 20;
    final accelerationLength = _IntegralCurve(Curves.linear).integral *
        100 *
        _accelerationDuration.inMilliseconds /
        1000.0;
    final decelerationLength = _IntegralCurve(Curves.decelerate).integral *
        100 *
        _decelerationDuration.inMilliseconds /
        1000.0;
    final linearLength =
        (totalLength - accelerationLength.abs() - decelerationLength.abs()) *
            (100 > 0 ? 1 : -1);
    _startPosition = 2 * totalLength;
    _accelerationTarget = _startPosition + accelerationLength;
    _linearTarget = _accelerationTarget + linearLength;
    _decelerationTarget = _linearTarget + decelerationLength;
    _totalDuration = _accelerationDuration +
        _decelerationDuration +
        Duration(milliseconds: (linearLength / 100 * 1000).toInt());
    _linearDuration =
        _totalDuration - _accelerationDuration - _decelerationDuration;
  }

  Future<void> _makeRoundTrip() async {
    if (!_controller.hasClients) return;
    _controller.jumpTo(_startPosition);
    if (!_running) return;

    await _animateTo(
      _accelerationTarget,
      _accelerationDuration,
      Curves.decelerate,
    );
    if (!_running) return;

    await _animateTo(_linearTarget, _linearDuration, Curves.linear);
    if (!_running) return;

    await _animateTo(
      _decelerationTarget,
      _decelerationDuration,
      Curves.decelerate.flipped,
    );
    if (!_running || !mounted) return;

    setState(() => _isOnPause = true);

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted || isDone) return;
    setState(() => _isOnPause = false);
  }

  Future<void> _animateTo(
    double? target,
    Duration? duration,
    Curve curve,
  ) async {
    if (!_controller.hasClients) return;
    if (duration! > Duration.zero) {
      await _controller.animateTo(target!, duration: duration, curve: curve);
    } else {
      _controller.jumpTo(target!);
    }
  }

  double _getTextWidth(BuildContext context) {
    final richTextWidget = Text.rich(TextSpan(
      text: widget.text,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width / 26,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
    )).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.layout(const BoxConstraints(maxWidth: double.infinity));

    final boxes = renderObject.getBoxesForSelection(TextSelection(
      baseOffset: 0,
      extentOffset: TextSpan(text: widget.text).toPlainText().length,
    ));

    return boxes.last.right;
  }

  @override
  Widget build(BuildContext context) {
    _initialize(context);
    return ListView.builder(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) {
        final text = i.isEven
            ? Text(
                widget.text,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 26,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(
                width: 20,
              );
        return Align(alignment: Alignment.center, child: text);
      },
    );
  }
}
