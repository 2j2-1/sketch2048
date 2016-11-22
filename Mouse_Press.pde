void mousePressed() {
  if (collide(inbetween+xOff, 4*seperation/board_dimension+inbetween+yOff, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50) && menu!=0) {
    menu = 0;
  } else if (collide(inbetween+xOff+((seperation/board_dimension-1)*2-inbetween/2)+inbetween/2+2, board_dimension*seperation/board_dimension+inbetween+yOff, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50) && menu ==1) {
    reset();
  }
  if (menu==0) {
    if (newGame.collide()) {
      menu=1;
    } else if (neuralNetworkButton.collide()) {
      menu=2;
    } else if (settings.collide()) {
      menu=3;
    }
  } else if (menu==2) {
    if (nextButton.collide()) {
      println(num_rows);
      a = new Weight(num_rows);
      nn = new neural_network(a.allWeights);
      menu=1;
    }
  }
}