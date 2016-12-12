class Population {
  DNA pop[];
  DNA temp[];

  int size;
  int pop_fitness[];
  int max_fitness;
  char[] blank = {'1'};
  float[][] testBoard = new float[1][16];

  Population(int Size, int[] _numRow) {
    size = Size;
    pop = new DNA[size];
    for (int i = 0; i < size; i++) {
      popWeights = new Weight(_numRow);
      pop[i] = new DNA(popWeights.allWeights);
    }
    pop_fitness = new int[size];
  }

  void mutate() {
    for (int i = 0; i<size; i++) {
      pop[i].mutation();
    }
  }

  void fitness() {
    for (int i = 0; i<size; i++) {
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      neural_network a = new neural_network(pop[i].genes);
      reset();
      pop_fitness[i]=0;
      for (int j=0; j<500; j++) {
        a.forward(testBoard);
      }
      pop_fitness[i]=score*max_board();
      //println(pop_fitness[i]);
    }
    max_fitness = max(pop_fitness);
  }

  void breed() {
    temp = pop;
    for (int i = 0; i<size; i++) {
      int r = floor(random(max_fitness));
      boolean exit = false;
      while (!exit) {
        int q =floor(random(size));
        if (pop_fitness[q] >= r) {
          pop[i].crossover(temp[q]);
        }
        exit = true;
      }
    }
  }

  void fitness_power(float power) {
    for (int i = 0; i<size; i++) {
      pop_fitness[i] = floor(pow(pop_fitness[i], power));
    }
    max_fitness = max(pop_fitness);
  }
  float average_fitness(){
    float sum = 0;
    for (int i=0;i<pop_fitness.length;i++){
      sum+=pop_fitness[i];
    }
    return sum/pop_fitness.length;
  }
}
