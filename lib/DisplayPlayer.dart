import 'package:flutter/material.dart';
import 'package:tie_tac_toe/Logic.dart';
import 'package:provider/provider.dart';

class DisplayPlayer extends StatelessWidget {
  const DisplayPlayer({
    required this.playerName,
    super.key,
  });
  final String playerName;

  @override
  Widget build(BuildContext context) {
    Color chooseColor() {
      if (Provider.of<Logic>(context).player) {
        if (playerName == 'Player 1') {
          return Colors.red;
        } else {
          return Colors.black;
        }
      } else {
        if (playerName == 'Player 2') {
          return Colors.blue;
        } else {
          return Colors.black;
        }
      }
    }

    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(top: 70.0),
        child: Text(
          playerName,
          textAlign: TextAlign.center,
          style: TextStyle(color: chooseColor(), fontSize: 30),
        ),
      ),
    );
  }
}

class DisplayWinningPlayer extends StatelessWidget {
  const DisplayWinningPlayer({
    required this.winningMessage,
    required this.playerColor,
    super.key,
  });
  final String winningMessage;
  final Color playerColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      winningMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: playerColor, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
