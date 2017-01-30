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
  void draw() {
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

  boolean collide() {
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
  void display() {
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
    rect(x+len+25,y-20,100,50);
    fill(255);
    textAlign(RIGHT, CENTER);
    text(str(value),floor(x+len+25),y-20,90,50);
    textAlign(CENTER, RIGHT);
    text(slider_text,x,y-50,len,y);
  }

  void collide() {
    // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
    if (col||(((mouseX<=slide_x+60)&&(mouseX>slide_x))||((slide_x<=mouseX+1)&&(slide_x>mouseX)))&&(((mouseY<=slide_y+70)&&(mouseY>slide_y))||((slide_y<=mouseY+1)&&(slide_y>mouseY))))
    {
      col = true;
      slide_x=constrain(mouseX,x,x+floor(len))-25;
    }
  } 
}