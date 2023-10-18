import 'package:flutter/material.dart';
import 'package:soduku_app/createSodukuBoard.dart';
import 'package:soduku_app/new_game.dart';
import 'package:soduku_app/sudoku_tutorial_page.dart';

class SudokuHomePage extends StatelessWidget {
  const SudokuHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            // Positioned Flags
            Positioned(
              top: 40,
              right: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO change language to norwegian
                    },
                    child: Image.asset(
                      'assets/images/norway_flag.png',
                      height: 30.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // TODO change language to english
                    },
                    child: Image.asset(
                      'assets/images/uk_flag.png',
                      height: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            // Existing Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50.0,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Sodukoid",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewGamePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: const Text('New Game'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateSudokuBoardPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: const Text('Create a Board'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SudokuTutorialPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: const Text('How to Play'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
