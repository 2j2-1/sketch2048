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

color[] tile_color= {
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
