import 'package:flutter/material.dart';
import 'package:tie_tac_toe/Tile.dart';
import 'package:tie_tac_toe/Logic.dart';
import 'package:provider/provider.dart';
import 'DisplayPlayer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
              color: Provider.of<Logic>(context).player
                  ? Colors.red
                  : Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: [
          DisplayPlayer(
            playerName: 'Player 1',
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  final bool? boardValue =
                      Provider.of<Logic>(context).board[index];
                  return Tile(
                    index: index,
                    value: boardValue,
                  );
                }),
              ),
            ),
          ),
          DisplayPlayer(
            playerName: 'Player 2',
          ),
        ],
      ),
    );
  }
}
