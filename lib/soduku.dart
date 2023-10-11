class Sudoku {
  late List<List<int>> board;

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
    for (int i = 0; i < 10; i++){
      // If any square on the same row OR colon shares the same value it's invalid
      if((board[row][i] == value && i != col) || (board[i][col] == value && i != row)){
        return false;
      }
    }
    return true;
  }

}
