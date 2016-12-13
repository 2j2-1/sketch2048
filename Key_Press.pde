void keyPressed() {
  if (keyCode == 32) {
    testingPop.evolve();
    println(testingPop.average_fitness());
    println();
  }
  else {
    move(keyCode);
  }
}
