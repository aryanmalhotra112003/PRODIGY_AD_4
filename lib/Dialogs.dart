import 'package:flutter/material.dart';
import 'DisplayPlayer.dart';

class WinningDialog extends StatelessWidget {
  const WinningDialog({
    super.key,
    required this.logic,
  });

  final dynamic logic;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
            width: 5, color: !logic.player ? Colors.red : Colors.blue),
      ),
      backgroundColor: Colors.white,
      title: Text(
        'Game Over',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.pink),
      ),
      content: logic.player //after player=!player
          ? DisplayWinningPlayer(
              winningMessage: 'Player 2 Wins!',
              playerColor: Colors.blue,
            )
          : DisplayWinningPlayer(
              winningMessage: 'Player 1 Wins!',
              playerColor: Colors.red,
            ),
      elevation: 15,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            logic.reset();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.black),
            ),
          ),
          child: Text(
            'Play again',
            style: TextStyle(color: Colors.pink, fontSize: 20),
          ),
        )
      ],
    );
  }
}

class DrawDialog extends StatelessWidget {
  const DrawDialog({
    super.key,
    required this.logic,
  });

  final dynamic logic;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(width: 5, color: Colors.purple),
      ),
      backgroundColor: Colors.white,
      title: Text(
        "It's a Draw",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.purple),
      ),
      content: Text(
        'Try again',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      elevation: 15,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            logic.reset();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.black),
            ),
          ),
          child: Text(
            'Reset',
            style: TextStyle(color: Colors.purple, fontSize: 20),
          ),
        )
      ],
    );
  }
}
