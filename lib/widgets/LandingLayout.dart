import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

Widget generateTitleContent(context, titlePadding, widgets) {
  return Expanded(
    flex: 2,
    child: Container(
        padding: titlePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        )),
  );
}

Widget generateActions(context, actionPadding, widgets) {
  return Container(
    padding: actionPadding,
    child: Row(
      children: widgets,
    ),
  );
}

class LandingLayout extends StatelessWidget {
  final EdgeInsets titlePadding;
  final EdgeInsets actionPadding;
  final List<Widget> actions;
  final List<Widget> content;
  final Color backgroundColor;

  LandingLayout({this.content, this.actions, this.titlePadding, this.actionPadding, this.backgroundColor});

  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        color: backgroundColor ?? null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            generateTitleContent(context, titlePadding, content),
            generateActions(context, actionPadding, actions),
          ],
        ),
      );
  }
}