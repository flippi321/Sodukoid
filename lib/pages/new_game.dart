import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soduku_app/classes/sodokuClass.dart';
import 'package:soduku_app/pages/soduku_board.dart';
import 'package:soduku_app/provider/language_provider.dart';
import 'package:soduku_app/widgets/custom_appbar.dart';

enum Difficulty { easy, medium, hard }

class NewGamePage extends StatelessWidget {
  const NewGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: languageProvider.get("newGame"),
      ),
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
              Text(
                languageProvider.get("selectDifficulty"),
                style: const TextStyle(
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
                child: Text(
                  languageProvider.get("easy"),
                ),
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
                child: Text(
                  languageProvider.get("medium"),
                ),
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
                child: Text(
                  languageProvider.get("hard"),
                ),
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

    bool success = await board.loadRandomBoard(boardName);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SudokuBoardPage(board: board),
        ),
      );
    }
  }
}
