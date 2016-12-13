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
      pop_fitness[i]=score;
      pop[i].fitness= pop_fitness[i];
      //println(pop_fitness[i]);
    }
    max_fitness = max(pop_fitness);
  }
// chnage this function so it muates last 3/4 with mutaions of the first
  void breed() {
    temp = pop;
    for (int i = 0; i<int(pop.length*0.75); i++) {
      pop[i].mutation(pop[int(random(int(pop.length*0.75),pop.length))]);
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


  void sort_pop(){
    int temp;
    DNA tempDNA;
    for (int i = 1; i<pop_fitness.length;i++){
      for (int j = 0; j<pop_fitness.length-1;j++){
        if (pop_fitness[j] > pop_fitness[j+1]){
          temp = pop_fitness[j];
          tempDNA = pop[j];

          pop_fitness[j] = pop_fitness[j+1];
          pop[j]=pop[j+1];

          pop_fitness[j+1] = temp;
          pop[j+1]=tempDNA;
        }
      }
    }
  }

  void evolve(){
      fitness();
      //fitness_power();
      sort_pop();
      for (int i = 0; i<pop.length;i++){
        println(pop[i].fitness);
      }

      println();
      breed();

  }
}
