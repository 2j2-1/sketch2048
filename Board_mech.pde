void place() {
  boolean placed = false;
  //searches board for free space if it cant game is over
  while (!placed) {
    int x=floor(random(4));
    int y=floor(random(4));
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
  //sets all values on board to 0
  score = 0;
  for (int x=0; x< 4; x++) {
    for (int y=0; y< 4; y++) {
      board[x][y] = 0;
    }
  }
  //places to random tiles
  place();
  place();
}

void move(int Key) {
  int[] ava_moves = {UP,RIGHT,LEFT,DOWN};
  if (menu == 1) {
    boolean placed = false;
    if (Key == UP) {
      //up searchs the board from top down moving any avilbile up this causes the tiles that for form to for at the top most spot instead of wherebottom first
      for (int i=0; i< 4; i++) {
        for (int x=0; x< 4; x++) {
          for (int y=1; y< 4; y++) {
            if (board[x][y]!=0) {
              if (board[x][y-1] == 0) {
                //moves if availble
                board[x][y-1] = board[x][y];
                board[x][y] = 0;
                placed = true;
              } else if (board[x][y-1] == board[x][y]) {
                //sets the bottom most tile that can be joined to 0 then sets the top to itself times a random number between 1.999 and 2.0 this prevents mre then one 
                //tile being joinedat a tiem and sets it back to normal at the end of the move by rounding, 1.999 and 2 is such a small difference the rounding error 
                //never exceeds a great enough to be rounding to the wrong number  
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
      for (int i=0; i< 4; i++) {
        for (int x=0; x< 4; x++) {
          for (int y=4-2; y>=0; y--) {
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
      for (int i=0; i< 4; i++) {
        for (int x=1; x< 4; x++) {
          for (int y=0; y< 4; y++) {
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
      for (int i=0; i< 4; i++) {
        for (int x=4-2; x>=0; x--) {
          for (int y=0; y<4; y++) {
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
    // if any move has been made place a new tile 
    if (placed) {
      place();
    }
  }
}
