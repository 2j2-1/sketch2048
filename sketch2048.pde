void setup() {
  fullScreen();
  //size(1024,1024);
  load();
  img.resize(width, height);
  seperation = 785;
  gameMenuSetup();
  create_sliders();
  node_setup();
  
}
void draw() {
  menuDisplay(menu);
}