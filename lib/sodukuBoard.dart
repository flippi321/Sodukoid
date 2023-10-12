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
                  .withOpacity(0.15), // Slight background color to the appbar
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
        child: Column(
          children: [
            const SizedBox(height: 50,),
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
                  Color borderColor = Colors.black38; // Default border color
                  Color? cellColor = isLocked ? Colors.grey[300] : Colors.white;

                  // The selected square will have a blue backround
                  if (selectedSquare != null &&
                      !isLocked &&
                      selectedSquare![0] == row &&
                      selectedSquare![1] == col) {
                    cellColor = Colors.blueAccent;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Ensuring UI reflects the change
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
                          style: const TextStyle(fontSize: 20.0),
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
                spacing: 8.0, // Gap between buttons
                runSpacing: 4.0, // Gap between rows
                children: List.generate(10, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      // If we have selected a square we can modify it's value
                      if(selectedSquare!=null && selectedSquare?[0] != null && selectedSquare?[1] != null){
                        if (widget.board.setValue(selectedSquare![0], selectedSquare![1], index)){
                          print("Value at $selectedSquare cahnged to $index");
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
