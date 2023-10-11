class Sudoku {
  late List<List<int>> board;
  late List<List<bool>> lockedSquares;
  late String solutionLocation;

  Sudoku() {
    board = List.generate(9, (i) => List.generate(9, (j) => 0));
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

  bool isValidMove(int row, int col, int value) {
    // If the given value is locked, we cannot overwrite the value
    if(lockedSquares[row][col]){
      return false;
    }

    // Parse every square sharing the same row or column
    for (int i = 0; i < 10; i++){
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
}
