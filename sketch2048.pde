void setup() {
	size(1440,900);
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
