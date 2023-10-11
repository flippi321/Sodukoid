import 'dart:ui';
import 'package:flutter/material.dart';
import 'classes/sodokuClass.dart';

class SudokuBoardPage extends StatefulWidget {
  final Sudoku board;

  const SudokuBoardPage({super.key, required this.board});

  @override
  SudokuBoardPageState createState() => SudokuBoardPageState();
}

class SudokuBoardPageState extends State<SudokuBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("New Game"),
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
              color: Colors.black
                  .withOpacity(0.15), // Slight backround color to the appbar
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9,
          ),
          itemBuilder: (BuildContext context, int index) {
            int row = index ~/ 9;
            int col = index % 9;
            int value = widget.board.getValue(row, col);
            bool isLocked = widget.board.lockedSquares[row][col];

            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                enabled: !isLocked,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isLocked ? Colors.grey[300] : Colors.white,
                  border: const OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text: value == 0 ? '' : value.toString(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (newValue) {
                  if (newValue.isNotEmpty) {
                    int newIntValue = int.parse(newValue);
                    widget.board.setValue(row, col, newIntValue);
                  }
                },
              ),
            );
          },
          itemCount: 81,
        ),
      ),
    );
  }
}
