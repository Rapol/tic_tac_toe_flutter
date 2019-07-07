import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

class BackgroundAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BackgroundAnimationState();
  }
}

class BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<RelativeRect> rect;
  Animation<RelativeRect> rect2;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    rect = RelativeRectTween(
      begin: RelativeRect.fromLTRB(30, -60.0, 0, 0),
      end: RelativeRect.fromLTRB(30.0, 100, 0, 0.0),
    ).animate(curvedAnimation)
    ..addListener(() {
      if(rect.isCompleted){
        controller.repeat();
      }
    });
    rect2 = RelativeRectTween(
      begin: RelativeRect.fromLTRB(100.0, -60.0, 0, 0),
      end: RelativeRect.fromLTRB(100.0, 300.0, 0, 0),
    ).animate(curvedAnimation);
    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        PositionedTransition(
          rect: rect,
          child: Text('X',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(fontSizeFactor: 0.6)),
        ),
        PositionedTransition(
          rect: rect2,
          child: Text('O',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(fontSizeFactor: 0.6)),
        ),
      ],
    );
  }
}
