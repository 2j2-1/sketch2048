class DNA {
  float genes[][][];
  float fitness;
  DNA(float[][][] _genes) {
    genes = _genes;
  }

  void mutation(DNA partner) {
    for (int x = 0; x < genes.length; x++) {
        for (int y = 0; y < genes[x].length; y++) {
            for (int z = 0; z < genes[x][y].length; z++) {
                if (random(1) < 0.001) {
                    genes[x][y][z] += random(-0.1, 0.1);}
                else{
                  genes[x][y][z] = partner.genes[x][y][z];
                }
                }
                }
                }
              }

}
