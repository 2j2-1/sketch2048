void keyPressed() {
  if (keyCode == 32) {
    float[][] saveBoard = new float[1][16];
    float[][] testBoard = new float[1][16];    
    boolean same;
    boolean found = false;
    int count = 0;
    int i = 0;
    while(!found){
      same = false;
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      arrayCopy(testBoard, saveBoard);
      nn.forward(testBoard);
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
    
      for (int x =0; x < 16; x++) {
        if (round(saveBoard[0][x]) != round(testBoard[0][x])) {
          same = true;
          break;
        }
      }
      if (!same) {
        if(count==5){
        found = true;
        }
        else{
          count+=1;
        }
      }
      i+=1;
    }
    int fitness;
    fitness = score*max_board();
    println(fitness);
  } else {
    move(keyCode);
  }
}