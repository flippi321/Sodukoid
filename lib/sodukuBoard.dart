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
  List<int>? selectedSquare;

  // Method to clear the board
  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (!widget.board.lockedSquares[i][j]) {
          widget.board.setValue(i, j, 0);
        }
      }
    }
    setState(() {}); // Show changes
  }

  // Open a confirmation Dialog making sure that the user wants to clear the board
  Future<void> _showClearConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap outside the dialog to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clear the board?'),
          content: Text('Do you want to clear all non-locked values?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("New Game"),
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: _showClearConfirmationDialog,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange, Colors.blue],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                ),
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ 9;
                  int col = index % 9;
                  int value = widget.board.getValue(row, col);
                  bool isLocked = widget.board.lockedSquares[row][col];

                  Color borderColor = Colors.black; // bottom border
                  Color? cellColor = isLocked ? Colors.grey[300] : Colors.white;
                  Color textColor = Colors.black; // default text color

                  if (!widget.board.isValidPosition(row, col, value) &&
                      !isLocked) {
                    textColor = Colors
                        .red; // Change text color to red for invalid squares
                  }

                  // The selected square is blue
                  if (selectedSquare != null &&
                      !isLocked &&
                      selectedSquare![0] == row &&
                      selectedSquare![1] == col) {
                    cellColor = Colors.blue.withOpacity(0.75);
                  }

                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        (col % 3 == 0) ? 2.0 : 0.5,
                        (row % 3 == 0) ? 2.0 : 0.5,
                        (col % 3 == 2) ? 2.0 : 0.5,
                        (row % 3 == 2) ? 2.0 : 0.5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSquare = [row, col];
                        });
                        print('Square pressed: $selectedSquare');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cellColor,
                          border: Border.all(color: borderColor),
                        ),
                        child: Text(
                          value == 0 ? '' : value.toString(),
                          style: TextStyle(fontSize: 20.0, color: textColor),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 81,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: List.generate(10, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      if (selectedSquare != null &&
                          selectedSquare?[0] != null &&
                          selectedSquare?[1] != null) {
                        if (widget.board.setValue(
                            selectedSquare![0], selectedSquare![1], index)) {
                          setState(() {});
                          if (widget.board.isFinished()) {
                            print("Finished");
                          }
                        } else {
                          print("Could not change the value");
                        }
                      } else {
                        print("No square selected");
                      }
                    },
                    child: Text('$index'),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
