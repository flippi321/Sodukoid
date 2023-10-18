import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soduku_app/classes/sodokuClass.dart';
import 'package:soduku_app/sodukuBoard.dart';
import 'package:soduku_app/widgets/custom_appbar.dart';

enum Difficulty { easy, medium, hard }

class NewGamePage extends StatelessWidget {
  const NewGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "New Game"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Select Difficulty",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  _loadGame(context, Difficulty.easy);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Easy'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _loadGame(context, Difficulty.medium);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Medium'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _loadGame(context, Difficulty.hard);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Hard'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadGame(BuildContext context, Difficulty difficulty) async {
    String boardName = difficulty.name.toLowerCase();

    Sudoku board = Sudoku();

    bool success = await board.loadRandomBoard(boardName); // Use await to wait for the method to complete

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SudokuBoardPage(
              board:
                  board), // Removed the const keyword since board is a variable
        ),
      );
    }
    // TODO valid else?
  }
}
