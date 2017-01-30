class Neural_Network {
  float[][][] weight_list;


  Neural_Network(float[][][] _weight_list) {
    weight_list = _weight_list;
  }

  float[][] forward(float[][] x) {
    for (int i =0; i<weight_list.length;i++){
      x = dot(x, weight_list[i]);
    }
    return x;
  }
}
