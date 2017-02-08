import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch2048 extends PApplet {

public void setup() {
	
	//size(1366,768);
	//size(1440, 900);
	//size(1920,1080);
	//size(1280, 1024);
	//size(600, 512);
	load();
	img.resize(width, height);
	gameMenuSetup();
	createSliders();
	nodeSetup();
  //testing();
}

public void draw() {
	menuDisplay(menu);
}
public void place() {
  boolean placed = false;
  //searches board for free space if it cant game is over
  while (!placed) {
    int x=floor(random(4));
    int y=floor(random(4));
    if (board[x][y]==0) {
      if (random(10)>2) {
        board[x][y] = 2;
      } else {
        board[x][y] = 4;
      }
      placed=true;
    }
  }
}

public void reset() {
  //sets all values on board to 0
  score = 0;
  for (int x=0; x< 4; x++) {
    for (int y=0; y< 4; y++) {
      board[x][y] = 0;
    }
  }
  //places to random tiles
  place();
  place();
}

public void move(int Key) {
  int[] ava_moves = {UP,RIGHT,LEFT,DOWN};
  if (menu == 1) {
    boolean placed = false;
    if (Key == UP) {
      //up searchs the board from top down moving any avilbile up this causes the tiles that for form to for at the top most spot instead of wherebottom first
      for (int i=0; i< 4; i++) {
        for (int x=0; x< 4; x++) {
          for (int y=1; y< 4; y++) {
            if (board[x][y]!=0) {
              if (board[x][y-1] == 0) {
                //moves if availble
                board[x][y-1] = board[x][y];
                board[x][y] = 0;
                placed = true;
              } else if (board[x][y-1] == board[x][y]) {
                //sets the bottom most tile that can be joined to 0 then sets the top to itself times a random number between 1.999 and 2.0 this prevents mre then one 
                //tile being joinedat a tiem and sets it back to normal at the end of the move by rounding, 1.999 and 2 is such a small difference the rounding error 
                //never exceeds a great enough to be rounding to the wrong number  
                score+=board[x][y]*2;
                board[x][y-1] = board[x][y]*random(1.999f, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == DOWN) {
      for (int i=0; i< 4; i++) {
        for (int x=0; x< 4; x++) {
          for (int y=4-2; y>=0; y--) {
            if (board[x][y]!=0) {
              if (board[x][y+1] == 0) {
                board[x][y+1] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x][y+1] == board[x][y]) {
                score+=board[x][y]*2;
                board[x][y+1] = board[x][y]*random(1.999f, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == LEFT) {
      for (int i=0; i< 4; i++) {
        for (int x=1; x< 4; x++) {
          for (int y=0; y< 4; y++) {
            if (board[x][y]!=0) {
              if (board[x-1][y] == 0) {
                board[x-1][y] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x-1][y] == board[x][y]) {
                score+=board[x][y]*2;
                board[x][y] = board[x][y]*random(1.999f, 2);
                board[x-1][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    if (Key == RIGHT) {
      for (int i=0; i< 4; i++) {
        for (int x=4-2; x>=0; x--) {
          for (int y=0; y<4; y++) {
            if (board[x][y]!=0) {
              if (board[x+1][y] == 0) {
                board[x+1][y] = board[x][y];
                board[x][y] = 0;
                placed=true;
              } else if (board[x+1][y] == board[x][y]) {
                score+=board[x][y]*2;
                board[x+1][y] = board[x][y]*random(1.999f, 2);
                board[x][y] = 0;
                placed=true;
              }
            }
          }
        }
      }
    }
    // if any move has been made place a new tile 
    if (placed) {
      place();
    }
  }
}
class Button {
  int x, y, x1, y1, curve;
  String text = "";
  PFont text_font;
  
  Button(int _x, int _y, int _x1, int _y1, PFont _text) {
    x=_x;
    y=_y;
    x1=_x1;
    y1=_y1;
    curve = 20;
    text_font = _text;
  }
  public void draw() {
    //PushMatrix is used to push out the block of code so it does not interfear with the rest
    pushMatrix();
    //sets font if it has accidently been changed at another point
    textFont(text_font);
    //centers text so will always be in the exact center of the button
    textAlign(CENTER, CENTER);
    //universal color that can easily be changed with the addition of skins
    fill(tile_color[0]);
    rect(x, y, x1, y1,curve);
    fill(0);
    text(text,x,y,x1,y1);
    popMatrix();
  }

  public boolean collide() {
    // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
    if ((((mouseX<=x+x1)&&(mouseX>x))||((x<=mouseX+1)&&(x>mouseX)))&&(((mouseY<=y+y1)&&(mouseY>y))||((y<=mouseY+1)&&(y>mouseY))))
    {
      return(true);
    } else
    {
      return(false);
    }
  }
  
}

class Slider {
  int x;
  int y;
  float len;
  int min;
  int max;
  int slide_x;
  int slide_y;
  int value;
  String slider_text;
  boolean col;
  Slider(int _x, int _y, int _len, int _min, int _max, String _slider_text) {
    x=_x;
    y=_y;
    len=_len;
    min=_min;
    max=_max;
    //offsets for asthetics
    slide_x= x-25;
    slide_y=y-35;
    slider_text = _slider_text;
  }
  public void display() {
    //push matrix doesnt interfear with others
    pushMatrix();
    strokeWeight(2);
    fill(tile_color[0]);
    //slider button
    rect(x, y, len, 10, 5);
    strokeWeight(1);
    rect(slide_x+20, slide_y+10, 20, 60, 5);
    popMatrix();
    //round to a predefined limit to prevent float values unless specified
    value = round((((slide_x+25)-x)/(len))*(max-min))+min;
    rect(x+len+25,y-20,55,50);
    fill(0);
    textAlign(RIGHT, CENTER);
    text(str(value),floor(x+len+25),y-20,50,50);
    fill(255);
    textAlign(CENTER, RIGHT);
    text(slider_text,x,y-50,len,y);

  }

  public void collide() {
    // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
    if (col||(((mouseX<=slide_x+60)&&(mouseX>slide_x))||((slide_x<=mouseX+1)&&(slide_x>mouseX)))&&(((mouseY<=slide_y+70)&&(mouseY>slide_y))||((slide_y<=mouseY+1)&&(slide_y>mouseY))))
    {
      col = true;
      slide_x=constrain(mouseX,x,x+floor(len))-25;
    }
  } 
}
class DNA {
  float genes[][][];
  float fitness;
  DNA(float[][][] _genes) {
    genes = _genes;
  }

  public void mutation(DNA partner) {
    for (int x = 0; x < genes.length; x++) {
      for (int y = 0; y < genes[x].length; y++) {
        for (int z = 0; z < genes[x][y].length; z++) {
          if (random(1) < 0.05f) {
            genes[x][y][z] = partner.genes[x][y][z] + random(-0.1f, 0.1f);
          }
          else {
            genes[x][y][z] = partner.genes[x][y][z];
          }
        }
      }
    }
  }
}
public void displaySliderNodeDepth() {
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

public void displaySliderSettings() {
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

public void nodeDisplay() {
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

public void drawBoard() {
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

public void menuDisplay(int Menu) {
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
public float[][] dot(float[][] a, float[][] b) {
  //the dots function take 2 matixs and perform a matrix multiplaction for the neural network
  float[][]c = new float[a.length][b[0].length];
  for (int x = 0; x<a.length; x++) {
    for (int y = 0; y < b[0].length; y++) {
      for (int z = 0; z<a[0].length; z++) {
        c[x][y] += a[x][z]*b[z][y];
      }
    }
  }
  return c;
}

public boolean in(int b, int[]a){
  //test if int in a list
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return true;
    }
  }
  return false;
}

public int index(float[]a , float b){
  // find where the float is in a list
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return i;
    }
  }
  return -1;
}

public int indexFitness(int[] fit, int a){
  int location;
  // find the location of he int in a list
  for (int i=0; i< fit.length;i++){
    if (a==fit[i]){
      return i;
    }
  }
  return -1;
}


public float[] con(float[] a, float[] b, float[] c, float[] d){
  //shorthand for concatinate as it bring the 2dimensional array to a 1d array
  float[] e = new float[16];
  for (int i=0;i<3;i++){
    e[i] = a[i];
    e[i+1] = b[i];
    e[i+2] = c[i];
    e[i+3] = d[i];
  }
  return e;
}

public boolean collide(float bx, float by, float v, float r) {
  // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
  if ((((mouseX<=bx+v)&&(mouseX>bx))||((bx<=mouseX+1)&&(bx>mouseX)))&&(((mouseY<=by+r)&&(mouseY>by))||((by<=mouseY+1)&&(by>mouseY))))
  {
    return(true);
  } else
  {
    return(false);
  }
}

public int maxBoard() {
  float max = 0;
  //finds the max int on the board
  for (int x=0; x<board.length; x++) {
    if (max<max(board[x])) {
      max = max(board[x]);
    }
  }
  return ceil(max);
}

public int blankBoard(float[] board) {
  int count = 1;
  //count the number of blanks on the board 
  for (int x=0; x<board.length; x++) {
    if (board[x]==0) {
      count++;
    }
  }
  return count;
}
public void keyPressed() {
	if (keyCode == 32) {
		float[][] gaming_board = new float[1][16];
		gaming_board[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
		float[][] x = nn.forward(gaming_board);
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
			break;}
    println();
    println(maxBoard());

    println();
}
else {
	move(keyCode);
}
}
public void gameMenuSetup() {
  menu_button = new Button(inbetween+x_off, 4*seperation/4+(inbetween*2)+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  menu_button_settings = new Button(width/2-(ceil(((seperation/4-1))*2-inbetween/2)/2)-x_off/2, 4*seperation/4+inbetween+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  next_button = new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, 4*seperation/4+(inbetween*2)+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  score_button= new Button(inbetween+x_off, y_off+inbetween-50, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  heighest_button= new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, y_off+inbetween-50, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  new_game_button= new Button(inbetween+x_off+((seperation/4-1)*2-inbetween/2)+inbetween/2+2, 4*seperation/4+(inbetween*2)+y_off, ceil(((seperation/4-1))*2-inbetween/2), 50, mono24);
  new_game = new Button((width/2)-constrain(PApplet.parseInt(width/5),0,200), 300, constrain(PApplet.parseInt(width/2.5f),0,400), 100, mono48);
  neural_network_button = new Button((width/2)-constrain(PApplet.parseInt(width/5),0,200), 450, constrain(PApplet.parseInt(width/2.5f),0,400), 100, mono48);
  settings = new Button((width/2)-constrain(PApplet.parseInt(width/5),0,200), 600, constrain(PApplet.parseInt(width/2.5f),0,400), 100, mono48);
  new_game_button.text = "New Game";
  menu_button.text = "Menu";
  menu_button_settings.text = "Menu";
  next_button.text = "Next";  
}
public void gameMenuDraw() {
  score_button.text = "Score:"+ score;
  heighest_button.text = "Highest Tile: "+ maxBoard();
  score_button.draw();
  heighest_button.draw();
  new_game_button.draw();
}


public void mainMenu() {
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
public void mousePressed() {
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
      menu =1;
      redraw();
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
class Neural_Network {
  float[][][] weight_list;


  Neural_Network(float[][][] _weight_list) {
    weight_list = _weight_list;
  }

  public float[][] forward(float[][] x) {
    for (int i =0; i<weight_list.length;i++){
      x = dot(x, weight_list[i]);
    }
    return x;
  }
}
// sets all global varibles need to keep the rest of the program neat 

int seperation;
int inbetween = 10;
int x_off = 50;
int y_off;
int score = 0;
int menu =0;
int x_off_text=10;
int y_off_text=0;
int[] num_rows;
int testing_pop_size = 10;
int testing_pop_gens = 10;
int testing_moves = 500;

float[][] board = new float[4][4];
float[][] save_board = new float[1][16];

int[] tile_color= {
	color(255, 198, 150),
	color(255, 179, 110),
	color(255, 136, 18),
	color(255, 110, 0),
	color(255, 90, 0),
	color(255, 60, 0),
	color(255, 0, 0),
	color(255, 200, 0),
	color(255, 255, 0),
	color(128, 255, 0),
	color(0, 255, 0),
	color(0, 255, 255),
	color(0, 0, 255),
	color(255, 0, 255),
	color(255, 128, 255)
};

PImage img;
PFont mono;
PFont mono48;
PFont mono24;
PFont title;

ArrayList<Slider> sliders = new ArrayList();

Slider depth;
Slider population_size;
Slider training_iterations;
Slider training_moves;

Button new_game;
Button neural_network_button;
Button settings;
Button menu_button;
Button menu_button_settings;
Button score_button;
Button heighest_button;
Button new_game_button;
Button next_button;




Neural_Network nn;

Weight a;
Weight pop_weights;

Population testing_pop;
class Weight {
  float[][] w1;
  float[][] w2;
  float[][] w3;
  float[][] w4;
  float[][] w5;
  float[][] w6;
  float[][] w7;
  float[][] w8;
  int depth;
  float random_lower_lim = -1;
  float random_upper_lim = 1;
  float[][][] all_weights;
  int[] row_size;
  
  Weight(int[] _row_size) {
    depth=_row_size.length;
    row_size = _row_size;
    settingWeigth();
  }

  public float[][] randomWeights(float[][] a) {
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y<a[x].length; y++) {
        a[x][y] = random(random_lower_lim, random_upper_lim);
      }
    }
    return a;
  }

  public void settingWeigth() {
    switch(num_rows.length) {
      case 2:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      break;
      case 3:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      break;
      case 4:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      break;
      case 5:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      break;
      case 6:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      break;
      case 7:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      break;
      case 8:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      w7 = new float[row_size[6]][row_size[7]];
      w7 = randomWeights(w7);
      break;
      case 9:
      w1 = new float[row_size[0]][row_size[1]];
      w1 = randomWeights(w1);
      w2 = new float[row_size[1]][row_size[2]];
      w2 = randomWeights(w2);
      w3 = new float[row_size[2]][row_size[3]];
      w3 = randomWeights(w3);
      w4 = new float[row_size[3]][row_size[4]];
      w4 = randomWeights(w4);
      w5 = new float[row_size[4]][row_size[5]];
      w5 = randomWeights(w5);
      w6 = new float[row_size[5]][row_size[6]];
      w6 = randomWeights(w6);
      w7 = new float[row_size[6]][row_size[7]];
      w7 = randomWeights(w7);
      w8 = new float[row_size[7]][row_size[8]];
      w8 = randomWeights(w8);
      break;
    }
    switch(num_rows.length) {
      case 2:
      float[][][] _all_weights1 = {w1};
      all_weights = _all_weights1;
      break;
      case 3:
      float[][][] _all_weights2 = {w1, w2};
      all_weights = _all_weights2;
      break;
      case 4:
      float[][][] _all_weights3 = {w1, w2, w3};
      all_weights = _all_weights3;
      break;
      case 5:
      float[][][] _all_weights4 = {w1, w2, w3, w4};
      all_weights = _all_weights4;
      break;
      case 6:
      float[][][] _all_weights5 = {w1, w2, w3, w4, w5};
      all_weights = _all_weights5;
      break;
      case 7:
      float[][][] _all_weights6= {w1, w2, w3, w4, w5, w6};
      all_weights = _all_weights6;
      break;
      case 8:
      float[][][] _all_weights7 = {w1, w2, w3, w4, w5, w6, w7};
      all_weights = _all_weights7;
      break;
      case 9:
      float[][][] _all_weights8 = {w1, w2, w3, w4, w5, w6, w7, w8};
      all_weights = _all_weights8;
      break;
    }
  }
}
class Population {
  DNA pop[];
  DNA temp[];

  int size;
  int pop_fitness[];
  int max_fitness;
  char[] blank = {'1'};
  float[][] test_board = new float[1][16];
  float top_percentage=0.05f;

  Population(int _size, int[] _num_row) {
    size = _size;
    pop = new DNA[size];
    for (int i = 0; i < size; i++) {
      pop_weights = new Weight(_num_row);
      pop[i] = new DNA(pop_weights.all_weights);
    }
    pop_fitness = new int[size];
  }


  public void fitness() {
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
      pop_fitness[i]=PApplet.parseInt(pow(score,2)*maxBoard()*blankBoard(test_board[0]));
      pop[i].fitness= pop_fitness[i];
    }
    max_fitness = max(pop_fitness);
  }

  public void breed() {
    temp = pop;
    
    for (int i = 0; i<=PApplet.parseInt(pop.length*(1.0f-top_percentage)); i++) {
      pop[i].mutation(pop[PApplet.parseInt(random(PApplet.parseInt(pop.length*(1.0f-top_percentage)),pop.length))]);
    }
  }

  public void fitnessPower(float power) {
    for (int i = 0; i<size; i++) {
      pop_fitness[i] = floor(pow(pop_fitness[i], power));
      pop[i].fitness = floor(pow(pop[i].fitness, power));
    }
    max_fitness = max(pop_fitness);
  }

  public float averageFitness(){
    float sum = 0;
    for (int i = 0; i<pop.length; i++) {
      sum+=pop_fitness[i];
    }
    return sum/pop.length;
  }


  public void sortPop(){
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

  public void evolve(){
    fitness();
    sortPop();
    breed();

  }
}
public void load(){
  img = loadImage("autistic-neural-network-3-1.jpg");
  mono24 = loadFont("Ebrima-Bold-24.vlw");
  mono48 = loadFont("Ebrima-Bold-48.vlw");
  mono = loadFont("Ebrima-Bold-100.vlw");
  title = loadFont("AnonymousPro-200.vlw");
  seperation=PApplet.parseInt(height/1.3f);
  y_off = PApplet.parseInt(height/10);
  depth = new Slider(x_off, y_off, seperation-x_off-25, 1, 5, "Node Depth:");
  population_size = new Slider(x_off, y_off, width-x_off*3, 1, 999, "Population Size:");
  training_iterations = new Slider(x_off, y_off+100, width-x_off*3, 1, 999, "Training Iterations");
  training_moves = new Slider(x_off, y_off+200, width-x_off*3, 1, 999, "Moves Per Training Iteration");

  reset();
}

public void createSliders() {
  for (int i=0; i<depth.max+1; i++) {
    sliders.add(new Slider(x_off, (100*i)+200, seperation-x_off-25, 1, 10, "Nodes in  row "+(i+1)));
  }
}


public void nodeSetup() {
  num_rows = new int[depth.value+2];
  num_rows[0]=16;
  for (int i = 1; i<depth.value+2; i++) {
    num_rows[i] = sliders.get(i-1).value;
  }
  num_rows[depth.value+1]=4;
}

public void testing(){
  for (int x = 0; x < 4; ++x) {
    for (int y = 0; y < 4; ++y) {
      println("testing popualtion size:", pow(10,x),"testing popualtion generation:", pow(10,y));
      a = new Weight(num_rows);
      nn = new Neural_Network(a.all_weights);
      testing_pop = new Population(PApplet.parseInt(pow(10,x)), num_rows);
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
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "sketch2048" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
