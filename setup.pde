void load(){
  img = loadImage("wooden background.png");
  mono24 = loadFont("Ebrima-Bold-24.vlw");
  mono48 = loadFont("Ebrima-Bold-48.vlw");
  mono = loadFont("Ebrima-Bold-100.vlw");
  title = loadFont("AnonymousPro-200.vlw");
  reset();
  }

void create_sliders() {
  for (int i=0; i<depth.max+1; i++) {
    sliders.add(new Slider(100, (100*i)+200, 500, 1, 10, "Nodes in  row "+(i+1)));
  }
}


void node_setup() {
  num_rows = new int[depth.value+2];
  num_rows[0]=16;
  for (int i = 1; i<depth.value+2; i++) {
    num_rows[i] = sliders.get(i-1).value;
  }
  num_rows[depth.value+1]=4;
}