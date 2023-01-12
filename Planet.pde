//James Hua, IxD MDES, CCA 2023

class Planet {
 
  String name;
  String planetNumber;
  float gravity; //m/s^2
  float planetDiameter; //km
  float orbitalRadius; //km
  float orbitalPeriod; //days
  long orbitalDistance; //km
  float angularVelocity; //rad/s
  float angle; //rad
  float x;
  float y;
  float opacity;

  Planet(String n, String nm, float g, float pd, float or, float op, long od) {
    name = n;
    planetNumber = nm;
    gravity = g;
    planetDiameter = log(pd);
    orbitalRadius = map(log(or/10E6), 0, 8, 0, 400);
    orbitalPeriod = op;
    orbitalDistance = od;
    angularVelocity = TWO_PI/(op*86400)*10E3;
  }
  
//  float log10 (float x) {
//    return (log(x) / log(10));
//  }

  void move() {
    //orbit
    noFill();
    stroke(255, 100);
    ellipse(400, 400, orbitalRadius*2, orbitalRadius*2);
    //planet
    fill(76, 74, 102);
    stroke(255);
    x = 400 + (cos(angle) * orbitalRadius);
    y = 400 + (sin(angle) * orbitalRadius);
    ellipse(x, y, planetDiameter, planetDiameter);
    angle = angle + angularVelocity;
  }
  
  void hover(Planet e) {
    float loc = dist(mouseX, mouseY, 400, 400);
    //fade
    if ((loc < orbitalRadius + 8) && (loc > orbitalRadius - 8) && (opacity <= 255)) {
      opacity += 20;
    }
    else if (opacity >= 0) {
      opacity -= 10;
    }
    highlight();
    decorate();
    //text formatting
    PFont titleFont = loadFont("SIMPLECANDYRegular-36.vlw");
    textFont(titleFont);
    textAlign(CENTER);
    //text
    fill(76, 74, 102, opacity);
    text(planetNumber, 137, 788);
    fill(255, opacity);
    text(name, 254, 788);
    textSize(16);
    float distanceOrbit = orbitalDistance;
    String fromEarth;
    if (name == "earth") {
      fromEarth = "YOU ARE HOME";
    }
    else {
      float distanceEarth = dist(convert(x), convert(y), convert(e.x), convert(e.y));
      fromEarth = String.format("%2.2E", distanceEarth) + " km";
    }
    String details = "gravity .................... " + str(gravity) + " m/s2\norbital distance ........... " + String.format("%2.2E", distanceOrbit) + " km\norbital period ............. " + str(orbitalPeriod) + " days\ndistance from earth ........ " + fromEarth;
    //String details = "gravity ............................................................................... " + str(gravity) + " m/s2\norbital distance ................................................... " + String.format("%2.2E", distanceOrbit) + " km\norbital period ......................................................... " + str(orbitalPeriod) + " days\ndistance from earth ........................................ " + fromEarth;
    PFont descriptionFont = loadFont("OratorStd-14.vlw");
    textFont(descriptionFont);
    textAlign(LEFT);
    textLeading(16);
    text(details, 358, 770);
  }
  
  void highlight() {
    //highlight orbit
    noFill();
    stroke(255, opacity);
    ellipse(400, 400, orbitalRadius*2, orbitalRadius*2);
  }
  
  void decorate() {
    //boxes & decor
    fill(76, 74, 102, opacity*2);
    rect(100, 740, 600, 100);
    fill(255, opacity);
    rect(100, 740, 70, 70);
    noFill();
    stroke(76, 74, 102, opacity);
    pushMatrix();
    translate(135, 775);
    rotate(-PI/4);
    ellipse(0, 0, 50, 70); 
    popMatrix();
    stroke(255, opacity);
    rect(170, 740, 170, 70);
    rect(100, 810, 240, 30);
    rect(340, 740, 360, 100);
    rect(340, 740, 360, 100, 30, 30, 30, 30);
    stroke(255, opacity/2);
    float scaleVal = 5.0;
    float inc = PI/gravity;
    float angleWave = 0.0;
    for (int a = 105; a <= 335; a += 5 ) {
      float b = (sin(angleWave) * scaleVal);
      ellipse(a, b+825, 10, 15);
      b = (cos(angleWave+PI/4) * scaleVal);
      ellipse(a, b+825, 10, 15);
      angleWave += inc;
    }
  }
  
  float convert(float n) {
    return exp(map(n-400, 0, 400, 0, 8))*10E6;
  }
  
}
