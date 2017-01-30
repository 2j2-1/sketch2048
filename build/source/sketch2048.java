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
  
  load();
  img.resize(width, height);
  seperation = 785;
  gameMenuSetup();
  create_sliders();
  node_setup();

}
public void draw() {
  menuDisplay(menu);
}
public void setup_board() {
  float maxint =0;
  for (int x=0; x< board_dimension; x++) {
    for (int y=0; y< board_dimension; y++) {
      if (board[x][y]>maxint) {
        maxint = board[x][y];
      }
    }
  }
}

public void place() {
  boolean placed = false;
  while (!placed) {
    int x=floor(random(board_dimension));
    int y=floor(random(board_dimension));
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
  score = 0;
  for (int x=0; x< board_dimension; x++) {
    for (int y=0; y< board_dimension; y++) {
      board[x][y] = 0;
    }
  }
  place();
  place();
}

public void move(int Key) {
  if (menu == 1) {
    boolean placed = false;
    if (Key == UP) {
      for (int i=0; i< board_dimension; i++) {
        for (int x=0; x< board_dimension; x++) {
          for (int y=1; y< board_dimension; y++) {
            if (board[x][y]!=0) {
              if (board[x][y-1] == 0) {
                board[x][y-1] = board[x][y];
                board[x][y] = 0;
                placed = true;
              } else if (board[x][y-1] == board[x][y]) {
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
      for (int i=0; i< board_dimension; i++) {
        for (int x=0; x< board_dimension; x++) {
          for (int y=board_dimension-2; y>=0; y--) {
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
      for (int i=0; i< board_dimension; i++) {
        for (int x=1; x< board_dimension; x++) {
          for (int y=0; y< board_dimension; y++) {
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
      for (int i=0; i< board_dimension; i++) {
        for (int x=board_dimension-2; x>=0; x--) {
          for (int y=0; y<board_dimension; y++) {
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

    if (placed) {
      place();
    }
  }
}
class Button {
  int x, y, x1, y1, curve;
  String text = "";
  PFont textfont;
  
  Button(int _x, int _y, int _x1, int _y1, PFont _text) {
    
    x=_x;
    y=_y;
    x1=_x1;
    y1=_y1;
    curve = 20;
    textfont = _text;
  }
  public void Draw() {
    pushMatrix();
    textFont(textfont);
    textAlign(CENTER, CENTER);
    fill(tileColor[0]);
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
  int slideX;
  int slideY;
  int value;
  String sliderText;
  boolean Col;
  Slider(int _x, int _y, int _len, int _min, int _max, String _sliderText) {
    x=_x;
    y=_y;
    len=_len;
    min=_min;
    max=_max;
    slideX = x-25;
    slideY=y-35;
    sliderText = _sliderText;
  }
  public void display() {
    pushMatrix();
    strokeWeight(2);
    fill(tileColor[0]);
    rect(x, y, len, 10, 5);
    strokeWeight(1);
    rect(slideX+20, slideY+10, 20, 60, 5);
    popMatrix();
    value = round((((slideX+25)-x)/(len))*(max-min))+min;
    rect(x+len+25,y-20,100,50);
    fill(255);
    textAlign(RIGHT, CENTER);
    text(str(value),floor(x+len+25),y-20,90,50);
    textAlign(CENTER, RIGHT);
    text(sliderText,x,y-50,len,y);
  }

  public void collide() {
    // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
    if (Col||(((mouseX<=slideX+60)&&(mouseX>slideX))||((slideX<=mouseX+1)&&(slideX>mouseX)))&&(((mouseY<=slideY+70)&&(mouseY>slideY))||((slideY<=mouseY+1)&&(slideY>mouseY))))
    {
      Col = true;
      slideX=constrain(mouseX,x,x+floor(len))-25;
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
                if (random(1) < 0.001f) {
                    genes[x][y][z] += random(-0.1f, 0.1f);}
                else{
                  genes[x][y][z] = partner.genes[x][y][z];
                }
                }
                }
                }
              }

}
public void display_slider() {
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

public void node_display() {
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

public void draw_board() {
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

public void menuDisplay(int Menu) {
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
public float[][] dot(float[][] a, float[][] b) {
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
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return true;
    }
  }
  return false;
}

public int index(float[]a , float b){
  for (int i = 0; i < a.length;i++){
    if (a[i] == b){
      return i;
    }
  }
  return -1;
}

public int index_fitness(int[] fit, int a){
  int location;
  for (int i=0; i< fit.length;i++){
    if (a==fit[i]){
      return i;
    }
  }
  return -1;
}

public float[][] sigmoid(float[][] a) {
    float b[][] = new float[a.length][a[0].length];
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y < a[x].length; y++) {
        b[x][y] = 1/(exp(a[x][y]));
      }
    }
    return a;
  }

public float[] con(float[]a, float[]b, float[] c, float[] d){
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

public int max_board() {
  float max = 0;
  for (int x=0; x<board.length; x++) {
    if (max<max(board[x])) {
      max = max(board[x]);
    }
  }
  return ceil(max);
}
public void keyPressed() {
  if (keyCode == 32) {
    for (int i=0;i<5;i++){
      testingPop.evolve();}
    println(testingPop.average_fitness());
  
    println();
  }
  else {
    move(keyCode);
  }
}
public void gameMenuSetup() {
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
public void gameMenuDraw() {
  scoreButton.text = "Score:"+ score;
  heighestButton.text = "Highest Tile: "+ max_board();
  scoreButton.Draw();
  heighestButton.Draw();
  newGameButton.Draw();
}


public void main_menu() {
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
public void mousePressed() {
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
      //println(num_rows);
      a = new Weight(num_rows);
      nn = new neural_network(a.allWeights);
      testingPop = new Population(100, num_rows);
      menu=1;
    }
  }
}

public void mouseReleased(){


}
class neural_network {
  float[][][] weightList;


  neural_network(float[][][] WeightList) {
    weightList = WeightList;
    //println(weightList);
  }

  public float[][] forward(float[][] x) {
    for (int i =0; i<weightList.length;i++){
      x = sigmoid(dot(x, weightList[i]));
    }
    return x;
  }
}
int board_dimension=4;
int seperation;
int inbetween = 10;
int xOff = 50;
int yOff = 100;
int score = 0;
int menu =0;
int xOffText=10;
int yOffText=0;
int[] num_rows;

float[][] board = new float[board_dimension][board_dimension];
float[][] saveBoard = new float[1][16];

int[] tileColor= {color(255, 198, 150), color(255, 179, 110), color(255, 136, 18), color(255, 110, 0), color(255, 90, 0), color(255, 60, 0), color(255, 0, 0), color(255, 200, 0), color(255, 255, 0), color(128, 255, 0), color(0, 255, 0), color(0, 255, 255), color(0, 0, 255), color(255, 0, 255), color(255, 128, 255)};

PImage img;
PFont mono;
PFont mono48;
PFont mono24;
PFont title;

ArrayList<Slider> sliders = new ArrayList();

Slider depth = new Slider(100, 100, 500, 1, 7, "Node Depth");
Button newGame;
Button neuralNetworkButton;
Button settings;
Button menuButton;
Button scoreButton;
Button heighestButton;
Button newGameButton;
Button nextButton;
neural_network nn;
Weight a;
Population testingPop;
Weight popWeights;
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
  float randomLowerLim = -1;
  float randomUpperLim = 1;
  float[][][] allWeights;
  int[] rowSize;
  
  Weight(int[] _rowSize) {
    depth=_rowSize.length;
    rowSize = _rowSize;
    settingWeigth();
  }

  public float[][] randomWeights(float[][] a) {
    for (int x = 0; x<a.length; x++) {
      for (int y = 0; y<a[x].length; y++) {
        a[x][y] = random(randomLowerLim, randomUpperLim);
      }
    }
    return a;
  }

  public void settingWeigth() {
    switch(num_rows.length) {
    case 2:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      break;
    case 3:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      break;
    case 4:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      break;
    case 5:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      break;
    case 6:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      break;
    case 7:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      break;
    case 8:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      w7 = new float[rowSize[6]][rowSize[7]];
      w7 = randomWeights(w7);
      break;
    case 9:
      w1 = new float[rowSize[0]][rowSize[1]];
      w1 = randomWeights(w1);
      w2 = new float[rowSize[1]][rowSize[2]];
      w2 = randomWeights(w2);
      w3 = new float[rowSize[2]][rowSize[3]];
      w3 = randomWeights(w3);
      w4 = new float[rowSize[3]][rowSize[4]];
      w4 = randomWeights(w4);
      w5 = new float[rowSize[4]][rowSize[5]];
      w5 = randomWeights(w5);
      w6 = new float[rowSize[5]][rowSize[6]];
      w6 = randomWeights(w6);
      w7 = new float[rowSize[6]][rowSize[7]];
      w7 = randomWeights(w7);
      w8 = new float[rowSize[7]][rowSize[8]];
      w8 = randomWeights(w8);
      break;
    }
    switch(num_rows.length) {
    case 2:
      float[][][] _allWeights1 = {w1};
      allWeights = _allWeights1;
      break;
    case 3:
      float[][][] _allWeights2 = {w1, w2};
      allWeights = _allWeights2;
      break;
    case 4:
      float[][][] _allWeights3 = {w1, w2, w3};
      allWeights = _allWeights3;
      break;
    case 5:
      float[][][] _allWeights4 = {w1, w2, w3, w4};
      allWeights = _allWeights4;
      break;
    case 6:
      float[][][] _allWeights5 = {w1, w2, w3, w4, w5};
      allWeights = _allWeights5;
      break;
    case 7:
      float[][][] _allWeights6= {w1, w2, w3, w4, w5, w6};
      allWeights = _allWeights6;
      break;
    case 8:
      float[][][] _allWeights7 = {w1, w2, w3, w4, w5, w6, w7};
      allWeights = _allWeights7;
      break;
    case 9:
      float[][][] _allWeights8 = {w1, w2, w3, w4, w5, w6, w7, w8};
      allWeights = _allWeights8;
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
  float[][] testBoard = new float[1][16];

  Population(int Size, int[] _numRow) {
    size = Size;
    pop = new DNA[size];
    for (int i = 0; i < size; i++) {
      popWeights = new Weight(_numRow);
      pop[i] = new DNA(popWeights.allWeights);
    }
    pop_fitness = new int[size];
  }


  public void fitness() {
    for (int i = 0; i<size; i++) {
      testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
      neural_network a = new neural_network(pop[i].genes);
      reset();
      pop_fitness[i]=0;
      pop[i].fitness=0;
      for (int j=0; j<500; j++) {
        testBoard[0] = concat(concat(board[0], board[1]), concat(board[2], board[3]));
        float[][] x = a.forward(testBoard);
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
      pop_fitness[i]=score*max_board();
      pop[i].fitness= pop_fitness[i];
    }
    max_fitness = max(pop_fitness);
  }

  public void breed() {
    temp = pop;
    float top_percentage=0.05f;
    for (int i = 0; i<=PApplet.parseInt(pop.length*(1.0f-top_percentage)); i++) {
      //println(i);
      pop[i].mutation(pop[PApplet.parseInt(random(PApplet.parseInt(pop.length*(1.0f-top_percentage)),pop.length))]);
    }
  }

  public void fitness_power(float power) {
    for (int i = 0; i<size; i++) {
      pop_fitness[i] = floor(pow(pop_fitness[i], power));
      pop[i].fitness = floor(pow(pop[i].fitness, power));
    }
    max_fitness = max(pop_fitness);
  }

  public float average_fitness(){
    float sum = 0;
    for (int i=0;i<pop_fitness.length;i++){
      sum+=pop_fitness[i];
    }
    return sum/pop_fitness.length;
  }


  public void sort_pop(){
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
      //fitness_power();
      sort_pop();
      //println(pop_fitness);
      //for (int i = 0; i<pop.length;i++){
      //println(pop[pop.length-1].fitness);
      //}

      println();
      breed();

  }
}
public void load(){
  img = loadImage("wooden background.png");
  mono24 = loadFont("Ebrima-Bold-24.vlw");
  mono48 = loadFont("Ebrima-Bold-48.vlw");
  mono = loadFont("Ebrima-Bold-100.vlw");
  title = loadFont("AnonymousPro-200.vlw");
  reset();
  }

public void create_sliders() {
  for (int i=0; i<depth.max+1; i++) {
    sliders.add(new Slider(100, (100*i)+200, 500, 1, 10, "Nodes in  row "+(i+1)));
  }
}


public void node_setup() {
  num_rows = new int[depth.value+2];
  num_rows[0]=16;
  for (int i = 1; i<depth.value+2; i++) {
    num_rows[i] = sliders.get(i-1).value;
  }
  num_rows[depth.value+1]=4;
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "sketch2048" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
