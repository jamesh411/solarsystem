//James Hua, IxD MDES, CCA 2023
//"All models are wrong, but some are useful" - George Box
//planet size is log-transformed.
//orbital radius is scaled by an arbitrary factor and log-transformed.
//orbital velocity is scaled by an arbitrary factor.
//orbital eccentricity and inclination are not considered.

//data is sourced from NASA https://nssdc.gsfc.nasa.gov/planetary/factsheet/
//& Northwestern https://www.qrg.northwestern.edu/projects/vss/docs/space-environment/3-orbital-lengths-distances.html
Planet mercury = new Planet("mercury", "01.", 3.7, 4879, 57.9E6, 88, 360010253L);
Planet venus = new Planet("venus", "02.", 8.9, 12104, 108.2E6, 224.7, 679947840L);
Planet earth = new Planet("earth", "03.", 9.8, 12756, 149.6E6, 365.2, 939856896L);
Planet mars = new Planet("mars", "04.", 3.7, 6792, 228.0E6, 687, 1429097472L);
Planet jupiter = new Planet("jupiter", "05.", 23.1, 142984, 778.5E6, 4331, 4887577728L);
Planet saturn = new Planet("saturn", "06.", 9, 120536, 1432.0E6, 10747, 8957447770L);
Planet uranus = new Planet("uranus", "07.", 8.7, 51118, 2867.0E6, 30589, 18026744947L);
Planet neptune = new Planet("neptune", "08.", 11, 49528, 4515.0E6, 59800, 28263782131L);
Planet[] names = {mercury, venus, earth, mars, jupiter, saturn, uranus, neptune};
Star[] stars = {
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(), 
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star(),
  new Star(), new Star(), new Star(), new Star(), new Star()
  //ok i tried to initialize this in a for loop under setup() but it didn't work so this is what we're dealing with now.
};
float descriptionOpacity;

void setup() {
  size(800, 935);
  smooth(4);
  
}

void draw() {
  //background
  frameRate(60);
  background(76, 74, 102);
  fill(255);
  stroke(255);
  rect(15, 15, 770, 905);
  fill(76, 74, 102);
  rect(15, 15, 770, 905, 30, 30, 30, 30);
  fill(255);
  //title
  PFont titleFont = loadFont("SIMPLECANDYRegular-64.vlw");
  PFont descriptionFont = loadFont("OratorStd-14.vlw");
  textFont(titleFont);
  textAlign(CENTER);
  text("solar system", 400, 807);
  textAlign(RIGHT);
  textSize(36);
  text("the", 210, 787);
  textFont(descriptionFont);
  textAlign(RIGHT);
  textLeading(14);
  text(".............hover to explore\n- james hua", 580, 825);
  //flourishes
  noFill();
  pushMatrix();
  translate(185, 775);
  rotate(PI/4);
  ellipse(0, 0, 50, 70); 
  popMatrix();
  drawSparkle(268, 783, 10, 20);
  drawSparkle(595, 820, 16, 32);
  drawSparkle(620, 805, 30, 60);
  //sun
  drawSparkle(400, 400, 50, 100);
  //stars
  for (Star s : stars) {
    s.glow();
  }
  //planets
  for (Planet p : names) {
    p.hover(earth);
    p.move();
  }
  //info
  textFont(descriptionFont);
  textAlign(RIGHT);
  fill(255, 100+descriptionOpacity);
  text("+info.", 700, 860);
  if ((mouseX > 645) && (mouseX < 705) && (mouseY > 845) && (mouseY < 865) && (descriptionOpacity <= 255)) {
    descriptionOpacity += 20;
  }
  else if (descriptionOpacity >= 0) {
    descriptionOpacity -= 10;
  }
  noStroke();
  fill(76, 74, 102, descriptionOpacity*2);
  rect(100, 740, 600, 100);
  noFill();
  stroke(255, descriptionOpacity);
  rect(100, 740, 600, 100);
  rect(100, 740, 600, 100, 30, 30, 30, 30);
  fill(255, descriptionOpacity);
  textAlign(CENTER);
  textLeading(16);
  String notes = "data is sourced from nasa & northwestern. planet size is log-transformed. orbital radius is scaled by an arbitrary factor and log-transformed. orbital velocity is scaled by an arbitrary factor. orbital eccentricity and inclination are not considered.";
  text(notes, 125, 763, 550, 70);
}

void drawSparkle(float x, float y, float w, float h) {
  noFill();
  stroke(255);
  arc(x-w/2, y-h/2, w, h, 0, PI/2);
  arc(x+w/2, y-h/2, w, h, PI/2, PI);
  arc(x+w/2, y+h/2, w, h, PI, 3*PI/2);
  arc(x-w/2, y+h/2, w, h, 3*PI/2, 2*PI);
}
