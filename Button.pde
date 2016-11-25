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
  void Draw() {
    pushMatrix();
    textFont(textfont);
    textAlign(CENTER, CENTER);
    fill(tileColor[0]);
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
  void display() {
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

  void collide() {
    // collie test a squares and if any coordinate of the rect passed to it are are within the other it returns true
    if (Col||(((mouseX<=slideX+60)&&(mouseX>slideX))||((slideX<=mouseX+1)&&(slideX>mouseX)))&&(((mouseY<=slideY+70)&&(mouseY>slideY))||((slideY<=mouseY+1)&&(slideY>mouseY))))
    {
      Col = true;
      slideX=constrain(mouseX,x,x+floor(len))-25;
    }
  } 
}