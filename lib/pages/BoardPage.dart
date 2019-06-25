import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/models/Board.dart';
import 'package:tic_tac_toe/widget/Board.dart';

class BoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    return ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      builder: (context) => BoardModel(),
      child: Board(),
    );
  }
}
