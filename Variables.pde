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

color[] tileColor= {color(255, 198, 150), color(255, 179, 110), color(255, 136, 18), color(255, 110, 0), color(255, 90, 0), color(255, 60, 0), color(255, 0, 0), color(255, 200, 0), color(255, 255, 0), color(128, 255, 0), color(0, 255, 0), color(0, 255, 255), color(0, 0, 255), color(255, 0, 255), color(255, 128, 255)};

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