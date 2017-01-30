class Population {
  DNA pop[];
  DNA temp[];

  int size;
  int pop_fitness[];
  int max_fitness;
  char[] blank = {'1'};
  float[][] test_board = new float[1][16];
  float top_percentage=0.05;

  Population(int _size, int[] _num_row) {
    size = _size;
    pop = new DNA[size];
    for (int i = 0; i < size; i++) {
      pop_weights = new Weight(_num_row);
      pop[i] = new DNA(pop_weights.all_weights);
    }
    pop_fitness = new int[size];
  }


  void fitness() {
    for (int i = 0; i<size; i++) {
      test_board[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      Neural_Network a = new Neural_Network(pop[i].genes);
      reset();
      pop_fitness[i]=0;
      pop[i].fitness=0;
      for (int j=0; j<testing_moves; j++) {
        test_board[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
        float[][] x = a.forward(test_board);
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
      test_board[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      pop_fitness[i]=int(pow(score,2)*maxBoard()*blankBoard(test_board[0]));
      pop[i].fitness= pop_fitness[i];
    }
    max_fitness = max(pop_fitness);
  }

  void breed() {
    temp = pop;
    
    for (int i = 0; i<=int(pop.length*(1.0-top_percentage)); i++) {
      pop[i].mutation(pop[int(random(int(pop.length*(1.0-top_percentage)),pop.length))]);
    }
  }

  void fitnessPower(float power) {
    for (int i = 0; i<size; i++) {
      pop_fitness[i] = floor(pow(pop_fitness[i], power));
      pop[i].fitness = floor(pow(pop[i].fitness, power));
    }
    max_fitness = max(pop_fitness);
  }

  float averageFitness(){
    float sum = 0;
    for (int i = 0; i<pop.length; i++) {
      sum+=pop_fitness[i];
    }
    return sum/pop.length;
  }


  void sortPop(){
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
    sortPop();
    breed();

  }
}
