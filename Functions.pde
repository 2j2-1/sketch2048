float[][] dot(float[][] a, float[][] b) {
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

int index(float[]a , float b){
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return i;
    }
  }
  return -1;
}

int index_fitness(int[] fit, int a){
  int location;
  for (int i=0; i< fit.length;i++){
    if (a==fit[i]){
      return i;
    }
  }
  return -1;
}

float[][] sigmoid(float[][] a) {
    float b[][] = new float[a.length][a[0].length];
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y < a[x].length; y++) {
        b[x][y] = 1/(exp(a[x][y]));
      }
    }
    return a;
  }

float[] con(float[]a, float[]b, float[] c, float[] d){
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

int max_board() {
  float max = 0;
  for (int x=0; x<board.length; x++) {
    if (max<max(board[x])) {
      max = max(board[x]);
    }
  }
  return ceil(max);
}
