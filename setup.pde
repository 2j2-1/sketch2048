void load(){
  img = loadImage("wooden background.png");
  mono24 = loadFont("Ebrima-Bold-24.vlw");
  mono48 = loadFont("Ebrima-Bold-48.vlw");
  mono = loadFont("Ebrima-Bold-100.vlw");
  title = loadFont("AnonymousPro-200.vlw");
  reset();
}

void createSliders() {
  for (int i=0; i<depth.max+1; i++) {
    sliders.add(new Slider(100, (100*i)+200, 500, 1, 10, "Nodes in  row "+(i+1)));
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