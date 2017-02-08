void load(){
  img = loadImage("autistic-neural-network-3-1.jpg");
  mono24 = loadFont("Ebrima-Bold-24.vlw");
  mono48 = loadFont("Ebrima-Bold-48.vlw");
  mono = loadFont("Ebrima-Bold-100.vlw");
  title = loadFont("AnonymousPro-200.vlw");
  seperation=int(height/1.3);
  y_off = int(height/10);
  depth = new Slider(x_off, y_off, seperation-x_off-25, 1, 5, "Node Depth:");
  population_size = new Slider(x_off, y_off, width-x_off*3, 1, 999, "Population Size:");
  training_iterations = new Slider(x_off, y_off+100, width-x_off*3, 1, 999, "Training Iterations");
  training_moves = new Slider(x_off, y_off+200, width-x_off*3, 1, 999, "Moves Per Training Iteration");

  reset();
}

void createSliders() {
  for (int i=0; i<depth.max+1; i++) {
    sliders.add(new Slider(x_off, (100*i)+200, seperation-x_off-25, 1, 10, "Nodes in  row "+(i+1)));
  }
}


void nodeSetup() {
  num_rows = new int[depth.value+2];
  num_rows[0]=16;
  for (int i = 1; i<depth.value+2; i++) {
    num_rows[i] = sliders.get(i-1).value;
  }
  num_rows[depth.value+1]=4;
}

void testing(){
  for (int x = 0; x < 4; ++x) {
    for (int y = 0; y < 4; ++y) {
      println("testing popualtion size:", pow(10,x),"testing popualtion generation:", pow(10,y));
      a = new Weight(num_rows);
      nn = new Neural_Network(a.all_weights);
      testing_pop = new Population(int(pow(10,x)), num_rows);
      menu=1;
      testing_pop.fitness();
      for (int i=0;i<pow(10,y);i++){
        testing_pop.evolve();
        if (i==0){
          println(testing_pop.averageFitness());  
        }
      }
      println(testing_pop.averageFitness());
    }
  }
  exit();
}