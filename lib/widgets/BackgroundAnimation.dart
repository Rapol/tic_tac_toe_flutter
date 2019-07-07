import 'package:flutter/material.dart';

import 'package:tic_tac_toe/utils/AnimationManager.dart';

import 'package:tic_tac_toe/utils/helpers.dart';
import 'package:tic_tac_toe/constants.dart';

class BackgroundAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BackgroundAnimationState();
  }
}

class BackgroundAnimationState extends State<BackgroundAnimation>
    with TickerProviderStateMixin {
  static const int NUM_ANIMATIONS = 10;
  static const int MIN_ANIMATION_DURATION = 3;
  static const int MAX_ANIMATION_DURATION = 7;
  AnimationManager _animationManager;
  List<Animation<RelativeRect>> _rectAnimations = [];

  @override
  void initState() {
    super.initState();
    // Executed after the widget is built
    WidgetsBinding.instance.addPostFrameCallback(setupAnimations);
  }

  @override
  void dispose() {
    this._animationManager.disposeAnimations();
    super.dispose();
  }

  setupAnimations(Duration duration) {
    print(this.context.size.width);
    print(this.context.size.height);
    this._animationManager = new AnimationManager(
      numberOfAnimations: NUM_ANIMATIONS,
      miniumDurationInSeconds: MIN_ANIMATION_DURATION,
      maximumDurationInSeconds: MAX_ANIMATION_DURATION,
      maxHeight: this.context.size.height,
      maxWidth: this.context.size.width,
      ticker: this,
    );
    setState(() {
      this._rectAnimations.addAll(this._animationManager.rectAnimations);
      this._animationManager.startAnimations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      // for each animation, build a PositionedTransition widget
      children: this._rectAnimations.map((rect) {
        return PositionedTransition(
          rect: rect,
          child: Text(getRandomNumber(1) == 0 ? X_SYMBOL : O_SYMBOL,
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(fontSize: 42.0)),
        );
      }).toList(),
    );
  }
}
