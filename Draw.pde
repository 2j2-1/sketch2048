void displaySliderNodeDepth() {
  //Displays sliders as the sliders for node depth increases
  depth.display();
  for (int i=0; i<depth.value; i++) {
    sliders.get(i).display();
    if (mousePressed) {
      depth.collide();
      sliders.get(i).collide();
    }
    else{
      depth.col = false;
      sliders.get(i).col = false;
    }
  }
}

void displaySliderSettings() {
  //Display all sliders for the settings page
  population_size.display();
  training_iterations.display();
  training_moves.display();
  if (mousePressed) {
    population_size.collide();
    training_iterations.collide();
    training_moves.collide();
  }
  else{
    population_size.col = false;
    training_iterations.col = false;
    training_moves.col = false;
    
  }
  testing_pop_size = population_size.value;
  testing_pop_gens = training_iterations.value;
  testing_moves = training_moves.value;
}

void nodeDisplay() {
  int x_l_lim = seperation+x_off;
  int x_u_lim = width;
  int y_l_lim = y_off/4;
  int y_u_lim = height-y_off/2;
  fill(tile_color[0]);
  stroke(255, 255, 255);
  strokeWeight(2);
  for (int x = 0; x < num_rows.length-1; x++) {
    for (int y = 0; y < num_rows[x]; y++) {
      for (int i = 0; i < num_rows[x+1]; i++) {
        line(
          map((((width/num_rows.length+1)*x+1)+(width/num_rows.length+1)/2), 0, width, x_l_lim, x_u_lim), 
          map((((height/num_rows[x])*y)+height/num_rows[x]/2), 0, height, y_l_lim, y_u_lim),
          map((((width/num_rows.length+1)*(x+1)+1)+(width/num_rows.length+1)/2), 0, width, x_l_lim, x_u_lim),
          map((((height/num_rows[x+1])*i)+height/num_rows[x+1]/2), 0, height, y_l_lim, y_u_lim));
      }
    }
  }
  stroke(0,0,0);
  strokeWeight(1);
  for (int x = 0; x < num_rows.length-1; x++) {
    for (int y = 0; y < num_rows[x]; y++) {
      ellipse(
        map((((width/num_rows.length+1)*x+1)+(width/num_rows.length+1)/2), 0, width, x_l_lim, x_u_lim),
        map((((height/num_rows[x])*y)+height/num_rows[x]/2), 0, height, y_l_lim, y_u_lim), 40, 40);
      for (int i = 0; i < num_rows[x+1]; i++) {
        ellipse(
          map((((width/num_rows.length+1)*(x+1))+(width/num_rows.length+1)/2), 0, width, x_l_lim, x_u_lim),
          map((((height/num_rows[x+1])*i)+height/num_rows[x+1]/2), 0, height, y_l_lim, y_u_lim), 40, 40);
      }
    }
  }
}

void drawBoard() {
  for (int x=0; x< 4; x++) {
    for (int y=0; y< 4; y++) {
      //Rounds value to account for errors
      board[x][y] = ceil(board[x][y]);
      if (board[x][y] < 2) {
        fill(tile_color[0]);
      } else {
        // choses color from a list based on its values as all number are 2^x
        fill(tile_color[floor(log(board[x][y])/log(2))]);
      }
      rect((x*seperation/4)+inbetween+x_off, y*seperation/4+(inbetween*2)+y_off, (seperation/4-1)-inbetween/2, (seperation/4-1)-inbetween/2, 20);
      fill(0);
      textFont(mono48);
      text(str(floor(board[x][y])), (x*seperation/4)+inbetween+x_off-2, y*seperation/4+(inbetween*2)+y_off, (seperation/4-1)-inbetween/2, (seperation/4-1)-inbetween/2);
    }
  }
}

void menuDisplay(int Menu) {
  background(img);
  //switch case for different menu options
  switch (Menu) {
    case 0:
    mainMenu();
    break;
    case 1:
    drawBoard();
    nodeDisplay();
    gameMenuDraw();
    menu_button.draw();
    break;
    case 2:
    next_button.draw();
    displaySliderNodeDepth();
    nodeSetup();
    nodeDisplay();
    menu_button.draw();
    break;
    case 3:
    displaySliderSettings();
    menu_button_settings.draw();
    break;
    case 4:

    break;
  }
}