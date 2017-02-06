void setup() {
	//fullScreen();
	size(1366,768);
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
