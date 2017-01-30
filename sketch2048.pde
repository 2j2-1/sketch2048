void setup() {
	fullScreen();
	load();
	img.resize(width, height);
	gameMenuSetup();
	createSliders();
	nodeSetup();
  //testing();
}

void draw() {
	menuDisplay(menu);
}
