void gameMenuSetup() {
  menuButton = new Button(inbetween+xOff, board_dimension*seperation/board_dimension+inbetween+yOff, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50, mono24);
  nextButton = new Button(inbetween+xOff+((seperation/board_dimension-1)*2-inbetween/2)+inbetween/2+2, board_dimension*seperation/board_dimension+inbetween+yOff, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50, mono24);
  scoreButton= new Button(inbetween+xOff, inbetween+43, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50, mono24);
  heighestButton= new Button(inbetween+xOff+((seperation/board_dimension-1)*2-inbetween/2)+inbetween/2+2, inbetween+43, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50, mono24);
  newGameButton= new Button(inbetween+xOff+((seperation/board_dimension-1)*2-inbetween/2)+inbetween/2+2, board_dimension*seperation/board_dimension+inbetween+yOff, ceil(((seperation/board_dimension-1))*2-inbetween/2), 50, mono24);
  newGame = new Button((width/2)-200, 300, 400, 100, mono48);
  neuralNetworkButton = new Button((width/2)-200, 500, 400, 100, mono48);
  settings = new Button((width/2)-200, 700, 400, 100, mono48);
  newGameButton.text = "New Game";
  menuButton.text = "Menu";
  nextButton.text = "Next";  
}
void gameMenuDraw() {
  scoreButton.text = "Score:"+ score;
  heighestButton.text = "Highest Tile: "+ max_board();
  scoreButton.Draw();
  heighestButton.Draw();
  newGameButton.Draw();
}


void main_menu() {
  pushMatrix();
  textFont(title);
  textAlign(CENTER, RIGHT);
  fill(0);
  text("2048", map(mouseX,0,width,20,0), map(mouseY,0,200,10,6)+100, width-20, height);
  fill(tileColor[1]);
  text("2048", 0, 100, width, height);
  popMatrix();
  textFont(mono48);
  newGame.text = "New Game";
  newGame.Draw();
  neuralNetworkButton.text = "Neural Network";
  neuralNetworkButton.Draw();
  settings.text = "Settings";
  settings.Draw();
}