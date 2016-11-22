class neural_network {
  float[][][] weightList;
 
 
  neural_network(float[][][] WeightList) {
    weightList = WeightList;
    //println(weightList);
  }


  void forward(float[][] x) {
    for (int i =0; i<weightList.length;i++){
      x = dot(x, weightList[i]);
    }
    switch(index(x[0],max(x[0]))){
    case 0:
    move(UP);
    break;
    case 1:
    move(DOWN);
    break;
    case 2:
    move(LEFT);
    break;
    case 3:
    move(RIGHT);
    break;
  }
  }
}