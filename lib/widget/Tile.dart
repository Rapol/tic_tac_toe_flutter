import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Border _borderSettings;

  Tile(this._borderSettings);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Column(
        children: <Widget>[
          Container(
              height: 100.0,
              decoration: BoxDecoration(
                border: _borderSettings,
              ),
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'X',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.indigo,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}