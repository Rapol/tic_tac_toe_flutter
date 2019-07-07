import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tic_tac_toe/constants.dart' as constants;

final rand = new Random();

class BackgroundAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BackgroundAnimationState();
  }
}

class BackgroundAnimationState extends State<BackgroundAnimation>
    with TickerProviderStateMixin {
  static const int numberOfAnimations = 5;
  static const int MIN_ANIMATION_DURATION = 3;
  static const int MAX_ANIMATION_DURATION = 7;
  final List<AnimationController> controllers = [];
  final List<CurvedAnimation> curvedAnimations = [];
  final List<Animation<RelativeRect>> rectAnimations = [];

  initializeControllers(int i) {
    final int duration = getRandomNumber(MAX_ANIMATION_DURATION, MIN_ANIMATION_DURATION);
    controllers.add(AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
    ));
  }

  initializeAnimations(int i) {
    curvedAnimations
        .add(CurvedAnimation(parent: controllers[i], curve: Curves.easeInOut));
  }

  buildRectTweens(int i) {
    final double rndWidth = getRandomNumber(this.context.size.width.toInt()).toDouble();
    final Animation<RelativeRect> rect = RelativeRectTween(
      begin: RelativeRect.fromLTRB(rndWidth, -60.0, 0, 0),
      end: RelativeRect.fromLTRB(rndWidth, this.context.size.height, 0, 0.0),
    ).animate(curvedAnimations[i])
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controllers[i].repeat();
        }
      });
    rectAnimations.add(rect);
  }

  setupAnimations(Duration duration) {
    for (var i = 0; i < numberOfAnimations; i++) {
      initializeControllers(i);
      initializeAnimations(i);
      buildRectTweens(i);
      controllers[i].forward();
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(setupAnimations);
  }

  @override
  void dispose() {
    controllers?.forEach((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: this.rectAnimations.map((rect) {
        return PositionedTransition(
          rect: rect,
          child: Text(getRandomNumber(1) == 0 ? 'X' : 'O',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(fontSizeFactor: 0.6)),
        );
      }).toList(),
    );
  }
}

int getRandomNumber(int max, [int min = 0]) {
  return min + rand.nextInt(max + 1 - min);
}