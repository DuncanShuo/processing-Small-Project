ArrayList<PVector> circle = new ArrayList<PVector>();

PVector c;
PVector s;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);

  for (int angle = 0; angle < 360; angle += 3) {
    PVector c = PVector.fromAngle(radians(angle));
    c.mult(100);
    circle.add(c);
  }
}

void draw() {
  background(360);

  translate(width/2, height/2);
  strokeWeight(5);
  beginShape();
  noFill();
  stroke(50);
  for (PVector v : circle) {
    point(v.x, v.y);
  }
  endShape(CLOSE);
  
  for (int i = 0; i < circle.size(); i++) {
    s = PVector.random2D();
    circle.get(i).add(s);
  }
  
}
