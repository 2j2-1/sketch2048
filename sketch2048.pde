void setup() {
  fullScreen();
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
