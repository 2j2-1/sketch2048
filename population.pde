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


  void fitness() {
    for (int i = 0; i<size; i++) {
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      neural_network a = new neural_network(pop[i].genes);
      reset();
      pop_fitness[i]=0;
      pop[i].fitness=0;
      for (int j=0; j<500; j++) {
        a.forward(testBoard);
      }
      pop_fitness[i]=score*max_board();
      pop[i].fitness= pop_fitness[i];
      //println(pop_fitness[i]);
    }
    max_fitness = max(pop_fitness);
  }
// chnage this function so it muates last 3/4 with mutaions of the first
  void breed() {
    temp = pop;
    for (int i = pop.length/4; i<pop.length; i++) {
      pop[i].mutation();
    }
  }

  void fitness_power(float power) {
    for (int i = 0; i<size; i++) {
      pop_fitness[i] = floor(pow(pop_fitness[i], power));
      pop[i].fitness = floor(pow(pop[i].fitness, power));
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

  // fix this function, not sorting population properly
  void sort_pop(){
    temp = pop;
    int[] tempFitness = pop_fitness;
    pop_fitness = sort(pop_fitness);

    int[] newOrder = new int[tempFitness.length];
    for (int i=0; i< temp.length;i++){
      newOrder[i] = index_fitness(pop_fitness,tempFitness[i]);
      // pop_fitness[index_fitness(pop_fitness,tempFitness[i])];
    }

    for (int i=0; i< temp.length;i++){
      pop[i] = temp[newOrder[temp.length-1-i]];
    }
  }

  void evolve(){
      fitness();
      //fitness_power();
      for (int i=0; i< pop.length;i++){
        println(pop[i].fitness);
      }
      println();
      sort_pop();
      for (int i=0; i< pop.length;i++){
        println(pop[i].fitness);
      }
      //breed();

  }
}
