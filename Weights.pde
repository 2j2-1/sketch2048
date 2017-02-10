class Weight {
  float[][] w1;
  float[][] w2;
  float[][] w3;
  float[][] w4;
  float[][] w5;
  float[][] w6;
  float[][] w7;
  float[][] w8;
  int depth;
  float random_lower_lim = -2;
  float random_upper_lim = 2;
  float[][][] all_weights;
  int[] row_size;
  
  Weight(int[] _row_size) {
    depth=_row_size.length;
    row_size = _row_size;
    settingWeigth();
  }

  float[][] randomWeights(float[][] a) {
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y<a[x].length; y++) {
        a[x][y] = random(random_lower_lim, random_upper_lim);
      }
    }
    return a;
  }

  void settingWeigth() {
    switch(num_rows.length) {
      case 2:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      break;
      case 3:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      break;
      case 4:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      break;
      case 5:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      break;
      case 6:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      break;
      case 7:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      break;
      case 8:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      w7 = new float[row_size[6]][row_size[7]];
      w7 = randomWeights(w7);
      break;
      case 9:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      w7 = new float[row_size[6]][row_size[7]];
      w7 = randomWeights(w7);
      w8 = new float[row_size[7]][row_size[8]];
      w8 = randomWeights(w8);
      break;
    }
    switch(num_rows.length) {
      case 2:
      float[][][] _all_weights1 = {w1};
      all_weights = _all_weights1;
      break;
      case 3:
      float[][][] _all_weights2 = {w1, w2};
      all_weights = _all_weights2;
      break;
      case 4:
      float[][][] _all_weights3 = {w1, w2, w3};
      all_weights = _all_weights3;
      break;
      case 5:
      float[][][] _all_weights4 = {w1, w2, w3, w4};
      all_weights = _all_weights4;
      break;
      case 6:
      float[][][] _all_weights5 = {w1, w2, w3, w4, w5};
      all_weights = _all_weights5;
      break;
      case 7:
      float[][][] _all_weights6= {w1, w2, w3, w4, w5, w6};
      all_weights = _all_weights6;
      break;
      case 8:
      float[][][] _all_weights7 = {w1, w2, w3, w4, w5, w6, w7};
      all_weights = _all_weights7;
      break;
      case 9:
      float[][][] _all_weights8 = {w1, w2, w3, w4, w5, w6, w7, w8};
      all_weights = _all_weights8;
      break;
    }
  }
}