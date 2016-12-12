class DNA {
  float genes[][][];

  DNA(float[][][] _genes) {
    genes = _genes;
  }

  void crossover(DNA partner) {
    float newGenes[][][] = genes;
    for (int x = 0; x < genes.length; x++) {
      for (int y = 0; y < genes[x].length; y++) {
        for (int z = 0; z < genes[x][y].length; z++) {
      // if (random(1)<0.5) {
        newGenes[x][y][z] = (genes[x][y][z]+partner.genes[x][y][z])/2;
      // } else {
      //   newGenes[i] = partner.genes[i];
      // }
        }
      }
    }
    genes = newGenes;
  }

  void mutation() {
    for (int x = 0; x < genes.length; x++) {  for (int y = 0; y < genes[x].length; y++) {  for (int z = 0; z < genes[x][y].length; z++) {  if (random(1) < 0.01) {
      genes[x][y][z] = random(-1, 1);
     }}}}}

}
