import 'package:flutter/material.dart';

import 'package:tic_tac_toe/utils/helpers.dart';

class AnimationManager {
  int numberOfAnimations;
  int miniumDurationInSeconds;
  int maximumDurationInSeconds;
  double maxWidth;
  double maxHeight;
  TickerProvider ticker;

  final List<AnimationController> _controllers = [];
  final List<CurvedAnimation> _curvedAnimations = [];
  final List<Animation<RelativeRect>> _rectAnimations = [];

  AnimationManager({
    this.numberOfAnimations,
    this.miniumDurationInSeconds,
    this.maximumDurationInSeconds,
    this.maxWidth,
    this.maxHeight,
    this.ticker,
  }) {
    for (var i = 0; i < this.numberOfAnimations; i++) {
      _controllers.add(_initializeController(i));
      _curvedAnimations.add(_initializeAnimation(i));
      _rectAnimations.add(_buildRectTween(i));
    }
  }

  get rectAnimations => this._rectAnimations;

  void startAnimations() => this._controllers.forEach((c) => c.forward());
  void disposeAnimations() => this._controllers.forEach((c) => c.dispose());

  AnimationController _initializeController(int i) {
    final int duration = getRandomNumber(
        this.maximumDurationInSeconds, this.miniumDurationInSeconds);
    return AnimationController(
      vsync: this.ticker,
      duration: Duration(seconds: duration),
    );
  }

  CurvedAnimation _initializeAnimation(int i) {
    return CurvedAnimation(parent: this._controllers[i], curve: Curves.easeIn);
  }

  List<RelativeRect> _generateRelativeRect() {
    final double rndWidth = getRandomNumber(this.maxWidth.toInt()).toDouble();
    return [
      RelativeRect.fromLTRB(rndWidth, -60.0, 0, 0),
      RelativeRect.fromLTRB(rndWidth, this.maxHeight, 0, 0.0)
    ];
  }

  Animation<RelativeRect> _buildRectTween(int i) {
    final List<RelativeRect> relativeRects = _generateRelativeRect();
    final RelativeRectTween tween = RelativeRectTween(
      begin: relativeRects[0],
      end: relativeRects[1],
    );
    final Animation<RelativeRect> rect = tween
        .animate(this._curvedAnimations[i])
          ..addStatusListener((status) {
            restartAnimation(status, tween, this._controllers[i]);
          });
    return rect;
  }

  // Updates animation tween and duration and restarts it
  restartAnimation(AnimationStatus status, RelativeRectTween tween,
      AnimationController controller) {
    if (status == AnimationStatus.completed) {
      final List<RelativeRect> newRelativeRect = _generateRelativeRect();
      tween.begin = newRelativeRect[0];
      tween.end = newRelativeRect[1];
      final int duration = getRandomNumber(
          this.maximumDurationInSeconds, this.miniumDurationInSeconds);
      controller.duration = Duration(seconds: duration);
      controller.reset();
      controller.forward();
    }
  }
}
