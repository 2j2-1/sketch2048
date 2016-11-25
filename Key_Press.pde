void keyPressed() {
  if (keyCode == 32) {
    float[][] saveBoard = new float[1][16];
    float[][] testBoard = new float[1][16];    
    boolean same;
    boolean found = false;
    while (!found) {
      same = true;
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      saveBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      nn.forward(testBoard);
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));

      for (int x =0; x < 16; x++) {
        println(round(saveBoard[0][x]), round(testBoard[0][x]));
        if (round(saveBoard[0][x]) != round(testBoard[0][x])) {
          //println(round(saveBoard[0][x]), round(testBoard[0][x]));
          same = false;
          break;
        }
      }
      println();
      if (same) {
        found = true;
      }
    }
    
    println(score*max_board());
  } else {
    move(keyCode);
  }
}