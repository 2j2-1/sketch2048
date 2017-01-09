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
        testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
        float[][] x = a.forward(testBoard);
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
      pop_fitness[i]=score*max_board();
      pop[i].fitness= pop_fitness[i];
    }
    max_fitness = max(pop_fitness);
  }

  void breed() {
    temp = pop;
    float top_percentage=0.05;
    for (int i = 0; i<=int(pop.length*(1.0-top_percentage)); i++) {
      //println(i);
      pop[i].mutation(pop[int(random(int(pop.length*(1.0-top_percentage)),pop.length))]);
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
      //println(pop_fitness);
      //for (int i = 0; i<pop.length;i++){
      //println(pop[pop.length-1].fitness);
      //}

      println();
      breed();

  }
}
