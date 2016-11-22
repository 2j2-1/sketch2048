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
  float randomLowerLim = -1;
  float randomUpperLim = 1;
  float[][][] allWeights;
  int[] rowSize;
  
  Weight(int[] _rowSize) {
    depth=_rowSize.length;
    rowSize = _rowSize;
    settingWeigth();
  }

  float[][] randomWeights(float[][] a) {
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y<a[x].length; y++) {
        a[x][y] = random(randomLowerLim, randomUpperLim);
      }
    }
    return a;
  }

  void settingWeigth() {
    switch(depth) {
    case 2:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      break;
    case 3:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      break;
    case 4:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      break;
    case 5:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      break;
    case 6:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      break;
    case 7:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      break;
    case 8:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      w7 = new float[rowSize[6]][rowSize[7]];
      w7 = randomWeights(w7);
      break;
    case 9:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      w7 = new float[rowSize[6]][rowSize[7]];
      w7 = randomWeights(w7);
      w8 = new float[rowSize[7]][rowSize[8]];
      w8 = randomWeights(w8);
      break;
    }
    switch(depth) {
    case 2:
      float[][][] _allWeights1 = {w1};
      allWeights = _allWeights1;
      break;
    case 3:
      float[][][] _allWeights2 = {w1, w2};
      allWeights = _allWeights2;
      break;
    case 4:
      float[][][] _allWeights3 = {w1, w2, w3};
      allWeights = _allWeights3;
      break;
    case 5:
      float[][][] _allWeights4 = {w1, w2, w3, w4};
      allWeights = _allWeights4;
      break;
    case 6:
      float[][][] _allWeights5 = {w1, w2, w3, w4, w5};
      allWeights = _allWeights5;
      break;
    case 7:
      float[][][] _allWeights6= {w1, w2, w3, w4, w5, w6};
      allWeights = _allWeights6;
      break;
    case 8:
      float[][][] _allWeights7 = {w1, w2, w3, w4, w5, w6, w7};
      allWeights = _allWeights7;
      break;
    case 9:
      float[][][] _allWeights8 = {w1, w2, w3, w4, w5, w6, w7, w8};
      allWeights = _allWeights8;
      break;
    }
  }
}