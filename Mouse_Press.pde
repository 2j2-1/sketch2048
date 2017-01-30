void mousePressed() {
  if (collide(inbetween+x_off, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50) && menu!=0) {
    menu = 0;
  } else if (collide(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50) && menu ==1) {
    reset();
  }
  if (menu==0) {
    if (new_game.collide()) {
      menu=1;
    } else if (neural_network_button.collide()) {
      menu=2;
    } else if (settings.collide()) {
      menu=3;
    }
  } else if (menu==2) {
    if (next_button.collide()) {
      a = new Weight(num_rows);
      testing_pop = new Population(testing_pop_size, num_rows);
      for (int i=0;i<testing_pop_gens;i++){
        testing_pop.evolve();
      }
      nn = new Neural_Network(testing_pop.pop[testing_pop_size-1].genes);
      menu = 1;
    }
  }else if (menu==3) {
    if (menu_button_settings.collide()) {
      menu = 0;
    }
  }
}