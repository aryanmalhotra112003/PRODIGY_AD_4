import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'package:provider/provider.dart';
import 'package:tie_tac_toe/Logic.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Logic();
      },
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
