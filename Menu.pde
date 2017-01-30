void gameMenuSetup() {
  menu_button = new Button(inbetween+x_off, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  menu_button_settings = new Button(inbetween+x_off+650, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  next_button = new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  score_button= new Button(inbetween+x_off, inbetween+43, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  heighest_button= new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, inbetween+43, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  new_game_button= new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  new_game = new Button((width/2)-200, 300, 400, 100, mono48);
  neural_network_button = new Button((width/2)-200, 500, 400, 100, mono48);
  settings = new Button((width/2)-200, 700, 400, 100, mono48);
  new_game_button.text = "New Game";
  menu_button.text = "Menu";
  menu_button_settings.text = "Menu";
  next_button.text = "Next";  
}
void gameMenuDraw() {
  score_button.text = "Score:"+ score;
  heighest_button.text = "Highest Tile: "+ maxBoard();
  score_button.draw();
  heighest_button.draw();
  new_game_button.draw();
}


void mainMenu() {
  pushMatrix();
  textFont(title);
  textAlign(CENTER, RIGHT);
  fill(0);
  text("2048", map(mouseX,0,width,20,0), map(mouseY,0,200,10,6)+100, width-20, height);
  fill(tile_color[1]);
  text("2048", 0, 100, width, height);
  popMatrix();
  textFont(mono48);
  new_game.text = "New Game";
  new_game.draw();
  neural_network_button.text = "Neural Network";
  neural_network_button.draw();
  settings.text = "Settings";
  settings.draw();
}