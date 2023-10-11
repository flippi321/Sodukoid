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
      if(){

      }
    }
    return true;
  }

}
