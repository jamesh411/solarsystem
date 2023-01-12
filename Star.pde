//James Hua, IxD MDES, CCA 2023

class Star {
  
  float x;
  float y;
  boolean type;
  float w;
  float h;
  float opacity;
  Boolean direction;
  float count;
  
  Star() {
    x = random(800);
    y = random(900);
    type = random(1) < .5;
    w = 2;
    h = 3;
    opacity = random(150);
    direction = random(1) < .5;
    count = random(4);
  }
  
  void glow() {
    noFill();
    stroke(255, opacity);
    if (type) {
      line(x-w, y, x+w, y);
      line(x, y-h, x, y+h);
    }
    else if (!type) {
      ellipse(x, y, h, h);
    }
    //glow direction
    if (direction) {
      opacity += 2;
    }
    else if (!direction) {
      opacity -= 2;
    }
    if (opacity <= 0) {
      direction = true;
      count++;
    }
    else if (opacity >= 150) {
      direction = false;
    }
    //new location
    if (count >= 5) {
      x = random(800);
      y = random(800);
      count = 0;
    }
  }
  
}
