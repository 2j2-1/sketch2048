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
      for (int j=0; j<500; j++) {
        a.forward(testBoard);
      }
      pop_fitness[i]=score*max_board();
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

  int index_fitness(int[] fit, int a){
    int location;
    for (int i=0; i< pop_fitness.length;i++){
      if (a==fit[i]){
        return i;
      }
    }
    return -1;
  }

  void sort_pop(){
    temp = pop;
    int[] tempFitness = pop_fitness;
    pop_fitness = sort(pop_fitness);

    int[] newOrder = new int[tempFitness.length];
    for (int i=0; i< temp.length;i++){
      newOrder[i] = index_fitness(pop_fitness,tempFitness[i]);
      pop_fitness[index_fitness(pop_fitness,tempFitness[i])] = 0;
    }
    //println(newOrder);
    for (int i=0; i< temp.length;i++){
      pop[i] = temp[newOrder[temp.length-1-i]];
    }

  }

  void evolve(){

      fitness();
      println(pop_fitness);
      println();
      //fitness_power();
      sort_pop();
      //breed();

  }
}
