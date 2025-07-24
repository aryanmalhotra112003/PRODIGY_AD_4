import 'package:flutter/material.dart';
import 'package:tie_tac_toe/Logic.dart';
import 'package:provider/provider.dart';
import 'package:tie_tac_toe/Dialogs.dart';

class Tile extends StatelessWidget {
  const Tile({super.key, required this.index, required this.value});
  final int index;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    dynamic logic = Provider.of<Logic>(context, listen: false);
    return GestureDetector(
      onTap: () {
        logic.makeMove(index);
        if (logic.checkForWin()) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => WinningDialog(logic: logic),
          );
        }
        if (logic.count == 9 && !logic.checkForWin()) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => DrawDialog(logic: logic),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: value == null ? Colors.white : Colors.black,
          border: Border.all(color: Colors.black),
        ),
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            value == null
                ? ''
                : value!
                    ? 'X'
                    : 'O',
            style: TextStyle(
                color: value == null
                    ? Colors.white
                    : value!
                        ? Colors.red
                        : Colors.blue,
                fontSize: 75,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
