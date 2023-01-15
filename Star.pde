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
    x = random(15, 785);
    y = random(15, 920);
    type = random(1) < .5;
    w = 2;
    h = 3;
    opacity = random(150);
    direction = random(1) < .5;
    count = random(2);
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
      opacity += 5;
    }
    else if (!direction) {
      opacity -= 5;
    }
    if (opacity <= 0) {
      direction = true;
      count++;
    }
    else if (opacity >= 150) {
      direction = false;
    }
    //new location
    if (count >= 3) {
      x = random(15, 785);
      y = random(15, 920);
      count = 0;
    }
  }
  
}
