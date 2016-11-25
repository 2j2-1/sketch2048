void setup_board() {
  float maxint =0;
  for (int x=0; x< board_dimension; x++) {
    for (int y=0; y< board_dimension; y++) {
      if (board[x][y]>maxint) {
        maxint = board[x][y];
      }
    }
  }
}

void place() {
  boolean placed = false;
  while (!placed) {
    int x=floor(random(board_dimension));
    int y=floor(random(board_dimension));
    if (board[x][y]==0) {
      if (random(10)>2) {
        board[x][y] = 2;
      } else {
        board[x][y] = 4;
      }
      placed=true;
    }
  }
}

void reset() {
  score = 0;
  for (int x=0; x< board_dimension; x++) {
    for (int y=0; y< board_dimension; y++) {
      board[x][y] = 0;
    }
  }
  place();
  place();
}

void move(int Key) {
  if (menu == 1) {
    boolean placed = false;
    if (Key == UP) {
      for (int i=0; i< board_dimension; i++) {
        for (int x=0; x< board_dimension; x++) {
          for (int y=1; y< board_dimension; y++) {
            if (board[x][y]!=0) {
              if (board[x][y-1] == 0) {
                board[x][y-1] = board[x][y];
                board[x][y] = 0;
                placed = true;
              } else if (board[x][y-1] == board[x][y]) {
                score+=board[x][y]*2;
                board[x][y-1] = board[x][y]*random(1.999, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == DOWN) {
      for (int i=0; i< board_dimension; i++) {
        for (int x=0; x< board_dimension; x++) {
          for (int y=board_dimension-2; y>=0; y--) {
            if (board[x][y]!=0) {
              if (board[x][y+1] == 0) {
                board[x][y+1] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x][y+1] == board[x][y]) {
                score+=board[x][y]*2;
                board[x][y+1] = board[x][y]*random(1.999, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == LEFT) {
      for (int i=0; i< board_dimension; i++) {
        for (int x=1; x< board_dimension; x++) {
          for (int y=0; y< board_dimension; y++) {
            if (board[x][y]!=0) {
              if (board[x-1][y] == 0) {
                board[x-1][y] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x-1][y] == board[x][y]) {
                score+=board[x][y]*2;
                board[x][y] = board[x][y]*random(1.999, 2);
                board[x-1][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == RIGHT) {
      for (int i=0; i< board_dimension; i++) {
        for (int x=board_dimension-2; x>=0; x--) {
          for (int y=0; y<board_dimension; y++) {
            if (board[x][y]!=0) {
              if (board[x+1][y] == 0) {
                board[x+1][y] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x+1][y] == board[x][y]) {
                score+=board[x][y]*2;
                board[x+1][y] = board[x][y]*random(1.999, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }

    if (placed) {
      place();
    }
  }
}