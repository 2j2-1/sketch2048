class neural_network {
  float[][][] weightList;


  neural_network(float[][][] WeightList) {
    weightList = WeightList;
    //println(weightList);
  }

  float[][] forward(float[][] x) {
    for (int i =0; i<weightList.length;i++){
      x = sigmoid(dot(x, weightList[i]));
    }
    return x;
  }
}
