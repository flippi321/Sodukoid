class Sudoku {
  late List<List<int>> board;

  Sudoku() {
    board = List.generate(9, (i) => List.generate(9, (j) => 0));
  }

  int getValue(int row, int col) {
    return board[row][col];
  }

  void setValue(int row, int col, int value) {
    board[row][col] = value;
  }

  bool isValidMove(int row, int col, int value) {
    // TODO add method
    return true;
  }

}
