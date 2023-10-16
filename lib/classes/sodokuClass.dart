import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soduku_app/classes/squareClass.dart';

class Sudoku {
  late List<List<SodukuSquare>> board;

  Sudoku() {
    board = List.generate(9, (i) => List.generate(9, (j) => (SodukuSquare(0, false, Colors.white))));
  }

  Future<bool> loadBoard(String boardName) async {
    // Load the CSV from assets/boards
    final data = await rootBundle.loadString('assets/boards/$boardName.csv');
    
    // Parse the CSV string
    final List<List<dynamic>> rows = const CsvToListConverter().convert(data);

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        board[i][j].value = int.parse(rows[i][j].toString());

        // If the board value is non-zero, lock the square
        if(board[i][j].value !=0){
          board[i][j].isLocked = true;
          board[i][j].backgroundColor = Colors.grey[400]!;
        }
      }
    }

    return true;
  }

  bool isFinished() {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      int value = board[row][col].value;
      // Check if the square is empty or not a valid move
      if (value == 0 || !isValidPosition(row, col, value)) {
        return false;
      }
    }
  }
  return true;
}


  int getValue(int row, int col) {
    return board[row][col].value;
  }

  bool setValue(int row, int col, int value) {
    if(isValidMove(row, col, value)){
      board[row][col].value = value;
      return true;
    }
    return false;
  }

  bool setColor(int row, int col, Color color) {
    // As long as the position isn't locked we can modify it's background
    if(!board[row][col].isLocked){
      board[row][col].backgroundColor = color;
      return true;
    }
    return false;
  }

  bool clearColor(int row, int col) {
    return setColor(row, col, Colors.white);
  }

  bool clearAllColors() {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (!board[i][j].isLocked) { // If the square is not locked
        board[i][j].backgroundColor = const Color.fromRGBO(255, 255, 255, 1.0); // set to white
      }
    }
  }
  return true;
}


  bool isValidPosition(int row, int col, int value){
    // Parse every square sharing the same row or column
      for (int i = 0; i < 9; i++){
        // If the square shares the same value, this move is invalid
        if((board[row][i].value == value && i != col) || (board[i][col].value == value && i != row)){
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
    if(board[row][col].isLocked){
      return false;
    }

    // If none of the issues appear, we are good
    return true;
  }
}
