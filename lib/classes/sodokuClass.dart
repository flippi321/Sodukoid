import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class Sudoku {
  late List<List<int>> board;
  late List<List<bool>> lockedSquares;
  late String solutionLocation;

  Sudoku() {
    board = List.generate(9, (i) => List.generate(9, (j) => (0)));
    lockedSquares = List.generate(9, (i) => List.generate(9, (j) => false));
  }

  Future<bool> loadBoard(String boardName) async {
    // Load the CSV from assets/boards
    final data = await rootBundle.loadString('assets/boards/$boardName.csv');
    
    // Parse the CSV string
    final List<List<dynamic>> rows = const CsvToListConverter().convert(data);

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        board[i][j] = int.parse(rows[i][j].toString());

        // If the board value is non-zero, lock the square
        lockedSquares[i][j] = board[i][j] !=0;
      }
    }

    solutionLocation = 'assets/boards/${boardName}Solution.csv';
    return true;
  }

  bool isFinished() {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      int value = board[row][col];
      // Check if the square is empty or not a valid move
      if (value == 0 || !isValidPosition(row, col, value)) {
        return false;
      }
    }
  }
  return true;
}


  int getValue(int row, int col) {
    return board[row][col];
  }

  bool setValue(int row, int col, int value) {
    if(isValidMove(row, col, value)){
      board[row][col] = value;
      return true;
    }
    return false;
  }

  bool isValidPosition(int row, int col, int value){
    // Parse every square sharing the same row or column
      for (int i = 0; i < 9; i++){
        // If the square shares the same value, this move is invalid
        if((board[row][i] == value && i != col) || (board[i][col] == value && i != row)){
          return false;
        }
      }

      // Check the 3x3 square the value is in
      int startRow = row - (row % 3);
      int startCol = col - (col % 3);
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[startRow + i][startCol + j] == value && (startRow + i != row || startCol + j != col)) {
            return false;
          }
        }
      }
      return true;
  }

  bool isValidMove(int row, int col, int value) {
    // Value has to be between 0 and 9
    if(value < 0 && value > 9){
      return false;
    }
    // If the given value is locked, we cannot overwrite the value
    if(lockedSquares[row][col]){
      return false;
    }

    // If none of the issues appear, we are good
    return true;
  }
}
