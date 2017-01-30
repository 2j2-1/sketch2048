float[][] dot(float[][] a, float[][] b) {
  //the dots function take 2 matixs and perform a matrix multiplaction for the neural network
  float[][]c = new float[a.length][b[0].length];
  for (int x = 0; x<a.length; x++) {
    for (int y = 0; y < b[0].length; y++) {
      for (int z = 0; z<a[0].length; z++) {
        c[x][y] += a[x][z]*b[z][y];
      }
    }
  }
  return c;
}

boolean in(int b, int[]a){
  //test if int in a list
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return true;
    }
  }
  return false;
}

int index(float[]a , float b){
  // find where the float is in a list
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return i;
    }
  }
  return -1;
}

int indexFitness(int[] fit, int a){
  int location;
  // find the location of he int in a list
  for (int i=0; i< fit.length;i++){
    if (a==fit[i]){
      return i;
    }
  }
  return -1;
}


float[] con(float[] a, float[] b, float[] c, float[] d){
  //shorthand for concatinate as it bring the 2dimensional array to a 1d array
  float[] e = new float[16];
  for (int i=0;i<3;i++){
    e[i] = a[i];
    e[i+1] = b[i];
    e[i+2] = c[i];
    e[i+3] = d[i];
  }
  return e;
}

boolean collide(float bx, float by, float v, float r) {
  // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
  if ((((mouseX<=bx+v)&&(mouseX>bx))||((bx<=mouseX+1)&&(bx>mouseX)))&&(((mouseY<=by+r)&&(mouseY>by))||((by<=mouseY+1)&&(by>mouseY))))
  {
    return(true);
  } else
  {
    return(false);
  }
}

int maxBoard() {
  float max = 0;
  //finds the max int on the board
  for (int x=0; x<board.length; x++) {
    if (max<max(board[x])) {
      max = max(board[x]);
    }
  }
  return ceil(max);
}

int blankBoard(float[] board) {
  int count = 1;
  //count the number of blanks on the board 
  for (int x=0; x<board.length; x++) {
    if (board[x]==0) {
      count++;
    }
  }
  return count;
}