import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart' as constants;

import 'package:tic_tac_toe/widget/LandingLayout.dart';

class LandingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: LandingLayout(
        titlePadding: EdgeInsets.fromLTRB(50.0, 0, 0, 60.0),
        content: <Widget>[
          Text(
            'Tic Tac',
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            'Toe',
            style: Theme.of(context).textTheme.display2,
          ),
        ],
        actionPadding: EdgeInsets.all(10.0),
        actions: <Widget>[
          Expanded(
            child: OutlineButton(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Start Game',
                style: Theme.of(context).textTheme.display3,
              ),
              onPressed: () => Navigator.pushNamed(context, '/game'),
              borderSide: BorderSide(width: 1.5, color: constants.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
