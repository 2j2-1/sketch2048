void display_slider() {
  depth.display();
  for (int i=0; i<depth.value; i++) {
    sliders.get(i).display();
    if (mousePressed) {
      depth.collide();
      sliders.get(i).collide();
    }
    else{
      depth.Col = false;
      sliders.get(i).Col = false;
    }
  }
}

void node_display() {
  int xLlim = 850;
  int xUlim = width-50;
  int yLlim = 50;
  int yUlim = height+200;
  fill(tileColor[0]);
  for (int x = 0; x < num_rows.length-1; x++) {
    for (int y = 0; y < num_rows[x]; y++) {
      for (int i = 0; i < num_rows[x+1]; i++) {
        line(map((((width/num_rows.length+1)*x+1)+(width/num_rows.length+1)/2), 0, width, xLlim, xUlim), map((((800/num_rows[x])*y)+800/num_rows[x]/2), 0, height, yLlim, yUlim), map((((width/num_rows.length+1)*(x+1)+1)+(width/num_rows.length+1)/2), 0, width, xLlim, xUlim), map((((800/num_rows[x+1])*i)+800/num_rows[x+1]/2), 0, height, yLlim, yUlim));
      }
    }
  }

  for (int x = 0; x < num_rows.length-1; x++) {
    for (int y = 0; y < num_rows[x]; y++) {
      ellipse(map((((width/num_rows.length+1)*x+1)+(width/num_rows.length+1)/2), 0, width, xLlim, xUlim), map((((800/num_rows[x])*y)+800/num_rows[x]/2), 0, height, yLlim, yUlim), 50, 50);
      for (int i = 0; i < num_rows[x+1]; i++) {
        ellipse(map((((width/num_rows.length+1)*(x+1))+(width/num_rows.length+1)/2), 0, width, xLlim, xUlim), map((((800/num_rows[x+1])*i)+800/num_rows[x+1]/2), 0, height, yLlim, yUlim), 50, 50);
      }
    }
  }
}

void draw_board() {
  for (int x=0; x< board_dimension; x++) {
    for (int y=0; y< board_dimension; y++) {
      board[x][y] = ceil(board[x][y]);
      if (board[x][y] < 2) {
        fill(tileColor[0]);
      } else {
        fill(tileColor[floor(log(board[x][y])/log(2))]);
      }
      rect((x*seperation/board_dimension)+inbetween+xOff, y*seperation/board_dimension+inbetween+yOff, (seperation/board_dimension-1)-inbetween/2, (seperation/board_dimension-1)-inbetween/2, 20);
      fill(0);
      textFont(mono48);
      text(str(floor(board[x][y])), (x*seperation/board_dimension)+inbetween+xOff-2, y*seperation/board_dimension+inbetween+yOff-2, (seperation/board_dimension-1)-inbetween/2, (seperation/board_dimension-1)-inbetween/2);
    }
  }
}

void menuDisplay(int Menu) {
  background(img);
  switch (Menu) {
  case 0:
    main_menu();
    break;
  case 1:
    setup_board();
    draw_board();
    node_display();
    gameMenuDraw();
    menuButton.Draw();
    break;
  case 2:
    nextButton.Draw();
    display_slider();
    node_setup();
    node_display();
    menuButton.Draw();
    break;
  case 3:
    menuButton.Draw();
    break;
  }
}