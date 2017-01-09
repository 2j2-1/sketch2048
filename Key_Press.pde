void keyPressed() {
  if (keyCode == 32) {
    for (int i=0;i<5;i++){
      testingPop.evolve();}
    println(testingPop.average_fitness());
  
    println();
  }
  else {
    move(keyCode);
  }
}
