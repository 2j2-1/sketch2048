void setup() {
	//fullScreen();
	//size(1366,768);
	//size(1440, 900);
	//size(1920,1080);
	//size(1280, 1024);
	//size(1400,1050);
	size(1600, 900);
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
