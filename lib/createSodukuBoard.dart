import 'dart:ui';
import 'package:flutter/material.dart';
import 'classes/sodokuClass.dart';

class CreateSudokuBoardPage extends StatefulWidget {
  const CreateSudokuBoardPage({super.key});

  @override
  CreateSudokuBoardPageState createState() => CreateSudokuBoardPageState();
}

class CreateSudokuBoardPageState extends State<CreateSudokuBoardPage> {
  Sudoku board = Sudoku();
  List<int>? selectedSquare;
  String? _selectedDifficulty;

  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board.board[i][j].isLocked) {
          board.setValue(i, j, 0);
        }
      }
    }
    selectedSquare = null;
    board.clearAllColors();
    setState(() {});
  }

  Future<void> _showClearConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear the board?'),
          content: const Text(
              'Are you sure you want to remove all your values on the board?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
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

  void _saveBoard() {
    if (_selectedDifficulty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a difficulty')));
      return;
    }
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (!board.isValidPosition(i, j, board.getValue(i, j))) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid squares present. Fix them first.')));
          return;
        }
      }
    }
    board.saveBoard(_selectedDifficulty!.toLowerCase());
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Board saved successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("New Board"),
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
              icon: const Icon(Icons.refresh, color: Colors.black),
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
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: _selectedDifficulty,
                  hint: const Text("Select Difficulty"),
                  items: <String>['Easy', 'Medium', 'Hard']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDifficulty = newValue;
                    });
                  },
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _saveBoard,
                  child: const Text("Save Board"),
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 9,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      int row = index ~/ 9;
                      int col = index % 9;
                      int value = board.getValue(row, col);
                      bool isLocked = board.board[row][col].isLocked;

                      Color borderColor = Colors.black;
                      Color cellColor = board.board[row][col].backgroundColor;
                      Color textColor = Colors.black;

                      if (selectedSquare != null &&
                          !isLocked &&
                          selectedSquare![0] == row &&
                          selectedSquare![1] == col) {
                        cellColor = Colors.blue.withOpacity(0.75);
                        borderColor = Colors.black;
                      }

                      if (!board.isValidPosition(row, col, value) &&
                          board.getValue(row, col) != 0) {
                        cellColor = Colors.red;
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
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cellColor,
                              border: Border.all(color: borderColor),
                            ),
                            child: Text(
                              value == 0 ? '' : value.toString(),
                              style:
                                  TextStyle(fontSize: 20.0, color: textColor),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 81,
                  ),
                ],
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
                        if (board.setValue(
                            selectedSquare![0], selectedSquare![1], index)) {
                          if (index != 0) {
                            board.setColor(selectedSquare![0],
                                selectedSquare![1], Colors.grey);
                          } else {
                            board.setColor(selectedSquare![0],
                                selectedSquare![1], Colors.white);
                          }
                          setState(() {});
                          if (board.isFinished()) {}
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Could not change the value')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('No square selected')));
                      }
                    },
                    child: index == 0 ? const Text('X') : Text('$index'),
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
